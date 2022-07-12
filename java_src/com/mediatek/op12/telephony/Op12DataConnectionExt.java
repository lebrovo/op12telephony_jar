package com.mediatek.op12.telephony;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncResult;
import android.os.SystemProperties;
import android.telephony.PcoData;
import android.telephony.Rlog;
import android.telephony.data.ApnSetting;
import android.text.TextUtils;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.dataconnection.ApnContext;
import com.mediatek.internal.telephony.dataconnection.DataConnectionExt;
import com.mediatek.internal.telephony.dataconnection.PcoDataAfterAttached;
import java.util.ArrayList;

public class Op12DataConnectionExt extends DataConnectionExt {
    static final String TAG = "Op12DataConnectionExt";
    private boolean mIsPcoAllowedDefault = true;

    public Op12DataConnectionExt(Context context) {
        super(context);
    }

    public void handlePcoDataAfterAttached(AsyncResult ar, Phone phone, ArrayList<ApnSetting> settings) {
        if (ar == null) {
            Rlog.e(TAG, "handlePcoDataAfterAttached ar is null");
        } else if (ar.exception != null) {
            Rlog.e(TAG, "handlePcoDataAfterAttached PCO_DATA exception: " + ar.exception);
        } else if (phone == null) {
            Rlog.e(TAG, "handlePcoDataAfterAttached phone is null");
        } else {
            PcoDataAfterAttached pcoData = (PcoDataAfterAttached) ar.result;
            if (pcoData == null) {
                Rlog.d(TAG, "handlePcoDataAfterAttached pco status is null");
                return;
            }
            Rlog.d(TAG, "handlePcoDataAfterAttached " + pcoData.toString());
            StringBuilder sb = new StringBuilder();
            sb.append("handlePcoDataAfterAttached pcoData.contents first byte: ");
            sb.append((int) pcoData.contents[0]);
            Rlog.d(TAG, sb.toString());
            if (pcoData.apnName == null || pcoData.apnName.isEmpty()) {
                Rlog.d(TAG, "handlePcoDataAfterAttached apn name null, send value only");
                sendPcoIdAndContentOnly(phone, pcoData);
                return;
            }
            String[] aryApnType = getApnType(pcoData.apnName, settings);
            if (aryApnType == null) {
                Rlog.d(TAG, "handlePcoDataAfterAttached getApnType() return null, send value only");
                sendPcoIdAndContentOnly(phone, pcoData);
                return;
            }
            for (String apnType : aryApnType) {
                Rlog.d(TAG, "handlePcoDataAfterAttached send intent for apn type: " + apnType);
                Intent intent = new Intent("com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE");
                intent.putExtra("apnType", apnType);
                intent.putExtra("apnTypeInt", ApnSetting.getApnTypesBitmaskFromString(apnType));
                intent.putExtra("apnProto", pcoData.bearerProto);
                intent.putExtra("apnProtoInt", ApnSetting.getProtocolIntFromString(pcoData.bearerProto));
                intent.putExtra("pcoId", pcoData.pcoId);
                intent.putExtra("pcoValue", pcoData.contents);
                phone.getCarrierSignalAgent().notifyCarrierSignalReceivers(intent);
            }
        }
    }

    private void sendPcoIdAndContentOnly(Phone phone, PcoDataAfterAttached pcoData) {
        Intent intent = new Intent("com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE");
        intent.putExtra("apnType", "");
        intent.putExtra("apnTypeInt", 0);
        intent.putExtra("apnProto", "");
        intent.putExtra("pcoId", pcoData.pcoId);
        intent.putExtra("pcoValue", pcoData.contents);
        phone.getCarrierSignalAgent().notifyCarrierSignalReceivers(intent);
    }

    private String[] getApnType(String apnName, ArrayList<ApnSetting> settings) {
        if (settings == null) {
            return null;
        }
        for (int i = 0; i < settings.size(); i++) {
            ApnSetting apn = settings.get(i);
            if (apnMatcher(apnName, apn.getApnName())) {
                return ApnSetting.getApnTypesStringFromBitmask(apn.getApnTypeBitmask()).split(",");
            }
        }
        return null;
    }

    private boolean apnMatcher(String apn, String compareApn) {
        if (apn.length() < compareApn.length()) {
            Rlog.d(TAG, "apnMatcher: length not match.");
            return false;
        }
        String tmpApn = apn.toLowerCase();
        String tmpCompareApn = compareApn.toLowerCase();
        boolean z = true;
        if (!tmpApn.equals(tmpCompareApn) && tmpApn.indexOf(compareApn) == -1) {
            z = false;
        }
        boolean ret = z;
        if (ret && tmpApn.length() != tmpCompareApn.length() && !tmpApn.startsWith(".mnc", tmpCompareApn.length()) && !tmpApn.startsWith(".mcc", tmpCompareApn.length())) {
            Rlog.d(TAG, "apnMatcher: apns are equal but format unexpected");
            ret = false;
        }
        if (tmpApn.indexOf(compareApn) != -1 && tmpApn.startsWith(".", tmpCompareApn.length())) {
            Rlog.d(TAG, "apnMatcher: apn are equal as apn.xxx type");
            ret = true;
        }
        Rlog.d(TAG, "apnMatcher: match: " + ret);
        return ret;
    }

    public boolean getIsPcoAllowedDefault() {
        return this.mIsPcoAllowedDefault;
    }

    public void setIsPcoAllowedDefault(boolean allowed) {
        this.mIsPcoAllowedDefault = allowed;
    }

    public int getPcoActionByApnType(ApnContext apnContext, PcoData pcoData) {
        if (TextUtils.equals(apnContext.getApnType(), "default")) {
            if (pcoData.contents[0] == 51) {
                if (SystemProperties.getInt("persist.vendor.pco3.teardown.internet", 0) == 1) {
                    Rlog.d(TAG, "getPcoActionByApnType PCO:3 disable and teardown default PDN");
                    setIsPcoAllowedDefault(false);
                    return 1;
                }
            } else if (pcoData.contents[0] == 48) {
                Rlog.d(TAG, "getPcoActionByApnType PCO:0 setIsPcoAllowedDefault true");
                setIsPcoAllowedDefault(true);
            }
        }
        return 0;
    }
}

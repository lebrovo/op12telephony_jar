package com.mediatek.op12.telephony.selfactivation;

import android.content.Context;
import com.mediatek.internal.telephony.selfactivation.SaPersistDataHelper;

public class SaOp12PersistDataHelper extends SaPersistDataHelper {
    public static final String DATA_KEY_ICCID = "dataKeyIccId";
    public static final String DATA_KEY_PCO = "dataKeyPco";

    public static String toString(Context context, int phoneId) {
        StringBuilder s = new StringBuilder();
        s.append("SaOp12PersistDataHelper {");
        s.append(" mDataName = " + getDataName(phoneId));
        s.append(" dataKeyIccId = " + getStringData(context, phoneId, DATA_KEY_ICCID, ""));
        s.append(" dataKeyPco = " + getIntData(context, phoneId, DATA_KEY_PCO, -1));
        s.append(" dataKeySaState = " + getIntData(context, phoneId, "dataKeySaState", -1));
        s.append("}");
        return s.toString();
    }
}

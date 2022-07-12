package com.mediatek.op12.telephony;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.AsyncResult;
import android.os.Binder;
import android.os.Handler;
import android.os.Message;
import android.telephony.Rlog;
import android.text.TextUtils;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.CommandsInterface;
import com.android.internal.telephony.uicc.IccUtils;
import com.mediatek.internal.telephony.MtkRIL;
import com.mediatek.internal.telephony.uicc.IMtkRsuSml;
import com.mediatek.internal.telephony.uicc.IMtkRsuSmlCallback;
import com.mediatek.opcommon.telephony.MtkRilOp;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import vendor.mediatek.hardware.radio_op.V3_0.RsuRequestInfo;
import vendor.mediatek.hardware.radio_op.V3_0.RsuResponseInfo;

public class Op12RsuSml12 extends IMtkRsuSml {
    private static final int BASE = 0;
    private static final int DUMMY_TOKEN = -1;
    private static final int OPERATOR_VERIZON = 1;
    private static final String[][] PACKAGENAME_SHA256SIG_PAIR = {new String[]{"com.verizon.mips.services", "ff82050bf6bed1f152ac1a12dc83cacbad401775161882872c6665fc5e15c8f2"}};
    private static final int REMOTE_SIM_UNLOCK_ERROR = 1;
    private static final int REMOTE_SIM_UNLOCK_SUCCESS = 0;
    private static final int RSU_MESSAGE_GET_LOCK_STATUS = 5;
    private static final int RSU_MESSAGE_GET_LOCK_VERSION = 3;
    private static final int RSU_MESSAGE_INIT_REQUEST = 1;
    private static final int RSU_MESSAGE_RESET_LOCK_DATA = 4;
    private static final int RSU_MESSAGE_UNLOCK_TIMER = 6;
    private static final int RSU_MESSAGE_UNSOL_RSU_EVENT = 7;
    private static final int RSU_MESSAGE_UPDATE_LOCK_DATA = 2;
    private static final String TAG = "Op12RsuSml12";
    private static final int USELESS_INT_VALUE = 0;
    private static final String USELESS_STRING_VALUE = "";
    public ArrayList<IMtkRsuSmlCallback> mCb = new ArrayList<>();
    private MtkRilOp[] mCi;
    private Context mContext;
    private Handler mRequestHandler = new Handler() {
        /* class com.mediatek.op12.telephony.Op12RsuSml12.AnonymousClass1 */

        public void handleMessage(Message msg) {
            int time;
            int status;
            AsyncResult ar = (AsyncResult) msg.obj;
            RsuResponseInfo rri = (RsuResponseInfo) ar.result;
            int token = msg.arg2;
            Op12RsuSml12 op12RsuSml12 = Op12RsuSml12.this;
            StringBuilder sb = new StringBuilder();
            sb.append("callback size = ");
            sb.append(Op12RsuSml12.this.mCb.size());
            sb.append(" exception = ");
            sb.append(ar.exception);
            sb.append(" errCode = ");
            sb.append(rri != null ? Integer.valueOf(rri.errCode) : "NULL");
            sb.append(" token = ");
            sb.append(token);
            sb.append(" what = ");
            sb.append(msg.what);
            op12RsuSml12.logd(sb.toString());
            synchronized (Op12RsuSml12.this) {
                int i = msg.what;
                if (i == 1) {
                    byte[] initRequest = null;
                    if (!(rri == null || rri.data == null)) {
                        Op12RsuSml12.this.logi("RSU_MESSAGE_INIT_REQUEST rri.data = " + rri.data);
                        initRequest = Op12RsuSml12.this.hexs2Bytes(rri.data);
                    }
                    Iterator<IMtkRsuSmlCallback> it = Op12RsuSml12.this.mCb.iterator();
                    while (it.hasNext()) {
                        IMtkRsuSmlCallback cb = it.next();
                        if (ar.exception == null && initRequest != null) {
                            if (initRequest.length != 0) {
                                cb.remoteSimlockGenerateRequestResponse(token, 0, initRequest);
                            }
                        }
                        cb.remoteSimlockGenerateRequestResponse(token, 1, (byte[]) null);
                    }
                } else if (i == 2) {
                    byte[] lockData = null;
                    if (!(rri == null || rri.data == null)) {
                        lockData = Op12RsuSml12.this.hexs2Bytes(rri.data);
                    }
                    Iterator<IMtkRsuSmlCallback> it2 = Op12RsuSml12.this.mCb.iterator();
                    while (it2.hasNext()) {
                        IMtkRsuSmlCallback cb2 = it2.next();
                        Op12RsuSml12.this.logd("callback cb = " + cb2);
                        if (ar.exception == null && lockData != null) {
                            if (lockData.length != 0) {
                                cb2.remoteSimlockProcessSimlockDataResponse(token, 0, lockData);
                            }
                        }
                        cb2.remoteSimlockProcessSimlockDataResponse(token, 1, (byte[]) null);
                    }
                } else if (i == 3) {
                    int version = -1;
                    int majorVersion = -1;
                    int minorVersion = -1;
                    if (rri != null) {
                        version = rri.version;
                    }
                    if (version >= 0) {
                        majorVersion = (version >> 16) & 65535;
                        minorVersion = version & 65535;
                    }
                    Op12RsuSml12.this.logd("majorVersion = " + majorVersion + ", minorVersion = " + minorVersion);
                    Iterator<IMtkRsuSmlCallback> it3 = Op12RsuSml12.this.mCb.iterator();
                    while (it3.hasNext()) {
                        IMtkRsuSmlCallback cb3 = it3.next();
                        if (ar.exception == null && majorVersion != -1) {
                            if (minorVersion != -1) {
                                cb3.remoteSimlockGetVersionResponse(token, 0, majorVersion, minorVersion);
                            }
                        }
                        cb3.remoteSimlockGetVersionResponse(token, 1, -1, -1);
                    }
                } else if (i == 5) {
                    if (rri == null) {
                        Op12RsuSml12.this.logd("RSU_MESSAGE_GET_LOCK_STATUS, rri == null");
                        status = 0;
                        time = 0;
                    } else {
                        Op12RsuSml12.this.logd("unlockStatus = " + rri.status + ", unlockTime = " + rri.time);
                        status = rri.status;
                        time = (int) rri.time;
                    }
                    if (token != -1 || ar.userObj == null) {
                        Iterator<IMtkRsuSmlCallback> it4 = Op12RsuSml12.this.mCb.iterator();
                        while (it4.hasNext()) {
                            IMtkRsuSmlCallback cb4 = it4.next();
                            if (ar.exception != null) {
                                cb4.remoteSimlockGetSimlockStatusResponse(token, 1, -1, -1);
                            } else {
                                cb4.remoteSimlockGetSimlockStatusResponse(token, 0, status, (long) time);
                            }
                        }
                    } else {
                        Message cb5 = (Message) ar.userObj;
                        if (ar.exception != null) {
                            AsyncResult.forMessage(cb5).exception = ar.exception;
                        } else {
                            AsyncResult.forMessage(cb5, Integer.valueOf(status), (Throwable) null);
                        }
                        cb5.sendToTarget();
                    }
                } else if (i != 6) {
                    Op12RsuSml12.this.logi("Unknown request or request that need not handle");
                } else {
                    int errCode = 0;
                    int time1 = 0;
                    if (rri == null) {
                        Op12RsuSml12.this.logd("RSU_MESSAGE_UNLOCK_TIMER, rri == null");
                    } else {
                        Op12RsuSml12.this.logd("timerStatus = " + rri.errCode + ", passedTime = " + rri.time);
                        errCode = rri.errCode;
                        time1 = (int) rri.time;
                    }
                    Iterator<IMtkRsuSmlCallback> it5 = Op12RsuSml12.this.mCb.iterator();
                    while (it5.hasNext()) {
                        IMtkRsuSmlCallback cb6 = it5.next();
                        if (ar.exception != null) {
                            cb6.remoteSimlockUnlockTimerResponse(token, 1, -1);
                        } else {
                            cb6.remoteSimlockUnlockTimerResponse(token, errCode, time1);
                        }
                    }
                }
            }
        }
    };
    private Handler mUrcHandler = new Handler() {
        /* class com.mediatek.op12.telephony.Op12RsuSml12.AnonymousClass2 */

        public void handleMessage(Message msg) {
            AsyncResult ar = (AsyncResult) msg.obj;
            Op12RsuSml12 op12RsuSml12 = Op12RsuSml12.this;
            op12RsuSml12.logd(" what = " + msg.what);
            if (msg.what != 7) {
                Op12RsuSml12.this.logi("Unknown urc or urc that need not handle");
                return;
            }
            String[] event = (String[]) ar.result;
            Op12RsuSml12 op12RsuSml122 = Op12RsuSml12.this;
            op12RsuSml122.logd("RSU_MESSAGE_UNSOL_RSU_EVENT eventId = " + event[0] + " eventString = " + event[1]);
        }
    };

    public Op12RsuSml12(Context context, CommandsInterface[] ci) {
        logi("initialize Op12RsuSml12");
        this.mContext = context;
        this.mCi = new MtkRilOp[ci.length];
        for (int i = 0; i < ci.length; i++) {
            this.mCi[i] = (MtkRilOp) ((MtkRIL) ci[i]).getRilOp();
        }
        this.mCi[0].registerForRsuEvent(this.mUrcHandler, 7, (Object) null);
    }

    public synchronized int registerCallback(Object cb) {
        logi("registerCallback IMtkRsuSmlCallback = " + cb);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), null)) {
            loge("registerCallback, permission denied");
            return 1;
        } else if (cb == null || !(cb instanceof IMtkRsuSmlCallback) || this.mCb.contains((IMtkRsuSmlCallback) cb)) {
            logi("registerCallback fail IMtkRsuSmlCallback = " + cb);
            return 1;
        } else {
            if (!this.mCb.isEmpty()) {
                Iterator<IMtkRsuSmlCallback> it = this.mCb.iterator();
                while (it.hasNext()) {
                    loge("Unexpected, New register incoming, will remove un-deregistered callback icb = " + it.next());
                }
                this.mCb.clear();
            }
            this.mCb.add((IMtkRsuSmlCallback) cb);
            logi("registerCallback callback size = " + this.mCb.size());
            return 0;
        }
    }

    public synchronized int deregisterCallback(Object cb) {
        logi("deregisterCallback IMtkRsuSmlCallback = " + cb);
        int i = 1;
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), null)) {
            loge("deregisterCallback, permission denied");
            return 1;
        }
        if (this.mCb.remove((IMtkRsuSmlCallback) cb)) {
            i = 0;
        }
        return i;
    }

    public int remoteSimlockProcessSimlockData(int token, byte[] data) {
        logd("remoteSimlockProcessSimlockData data = " + bytes2Hexs(data) + " mCi[0] = " + this.mCi[0] + " token = " + token);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), this.mRequestHandler.obtainMessage(2, 0, token))) {
            loge("remoteSimlockProcessSimlockData, permission denied");
            return 1;
        }
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 2, 0, bytes2Hexs(data)), this.mRequestHandler.obtainMessage(2, 0, token));
        return 0;
    }

    public int remoteSimlockGetVersion(int token) {
        logd("remoteSimlockGetVersion token = " + token + " mCi[0] = " + this.mCi[0]);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), this.mRequestHandler.obtainMessage(3, 0, token))) {
            loge("remoteSimlockGetVersion, permission denied");
            return 1;
        }
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 3, 0, USELESS_STRING_VALUE), this.mRequestHandler.obtainMessage(3, 0, token));
        return 0;
    }

    public int remoteSimlockGetSimlockStatus(int token) {
        logd("remoteSimlockGetSimlockStatus token = " + token + " mCi[0] = " + this.mCi[0]);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), this.mRequestHandler.obtainMessage(5, 0, token))) {
            loge("remoteSimlockGetSimlockStatus, permission denied");
            return 1;
        }
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 5, 0, USELESS_STRING_VALUE), this.mRequestHandler.obtainMessage(5, 0, token));
        return 0;
    }

    public int remoteSimlockGenerateRequest(int token, int requestType) {
        logd("remoteSimlockGenerateRequest token = " + token + " requestType = " + requestType + " mCi[0] = " + this.mCi[0]);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), this.mRequestHandler.obtainMessage(1, 0, token))) {
            loge("remoteSimlockGenerateRequest, permission denied");
            return 1;
        }
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 0, requestType, USELESS_STRING_VALUE), this.mRequestHandler.obtainMessage(1, 0, token));
        return 0;
    }

    public int remoteSimlockUnlockTimer(int token, int requestType) {
        logd("remoteSimlockUnlockTimer token = " + token + " requestType = " + requestType + " mCi[0] = " + this.mCi[0]);
        if (!enforcePermissionCheck(getCallerSignature(getCallerPackageName()), getCallerPackageName(), this.mRequestHandler.obtainMessage(6, 0, token))) {
            loge("remoteSimlockUnlockTimer, permission denied");
            return 1;
        }
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 50, requestType, USELESS_STRING_VALUE), this.mRequestHandler.obtainMessage(6, 0, token));
        return 0;
    }

    public int remoteSimlockGetSimlockStatusEx(Object cb) {
        logd("remoteSimlockGetSimlockStatusEx mCi[0] = " + this.mCi[0]);
        MtkRilOp[] mtkRilOpArr = this.mCi;
        if (mtkRilOpArr[0] == null) {
            return 1;
        }
        mtkRilOpArr[0].sendRsuRequest(constructRsuRequestInfoRilRequest(1, 5, 0, USELESS_STRING_VALUE), this.mRequestHandler.obtainMessage(5, 0, -1, cb));
        return 0;
    }

    private RsuRequestInfo constructRsuRequestInfoRilRequest(int opId, int requestId, int requestType, String data) {
        RsuRequestInfo rri = new RsuRequestInfo();
        rri.opId = opId;
        rri.requestId = requestId;
        rri.requestType = requestType;
        rri.data = data;
        return rri;
    }

    private String bytes2Hexs(byte[] bytes) {
        return IccUtils.bytesToHexString(bytes);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private byte[] hexs2Bytes(String data) {
        if (data != null && data.length() % 2 == 0) {
            return IccUtils.hexStringToBytes(data);
        }
        logi("The length of hex string is not even numbers");
        return null;
    }

    private String getCallerPackageName() {
        ActivityManager activityManager;
        int callerPid = Binder.getCallingPid();
        int callerUid = Binder.getCallingUid();
        String packageName = this.mContext.getPackageManager().getNameForUid(callerUid);
        if (TextUtils.isEmpty(packageName) && (activityManager = (ActivityManager) this.mContext.getSystemService("activity")) != null) {
            Iterator<ActivityManager.RunningAppProcessInfo> it = activityManager.getRunningAppProcesses().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ActivityManager.RunningAppProcessInfo info = it.next();
                if (info.pid == callerPid) {
                    packageName = info.processName;
                    break;
                }
            }
        }
        logd("getCallerPackageName callerPid = " + callerPid + "callerUid = " + callerUid + " processName = " + packageName);
        return packageName;
    }

    private Signature[] getCallerSignature(String packageName) {
        if (packageName == null || packageName.length() == 0) {
            logd("getCallerSignature fail, packageName is null");
            return null;
        }
        try {
            PackageInfo pi = this.mContext.getPackageManager().getPackageInfo(packageName, 64);
            if (pi == null) {
                logd("getCallerSignature fail, package information is null for packageName " + packageName);
                return null;
            }
            logd("getCallerSignature packageName " + packageName + ", signatures " + pi.signatures);
            return pi.signatures;
        } catch (PackageManager.NameNotFoundException e) {
            logd("getCallerSignature fail, has no packageName " + packageName);
            return null;
        }
    }

    private boolean enforcePermissionCheck(Signature[] signature, String packageName, Message msg) {
        this.mContext.checkCallingOrSelfPermission("com.verizon.permission.ACCESS_REMOTE_SIMLOCK");
        if (signature != null) {
            for (Signature s : signature) {
                if (matches(getCertHash(s, "SHA-256"), packageName)) {
                    return true;
                }
            }
        }
        return false;
    }

    private byte[] getCertHash(Signature signature, String algo) {
        try {
            return MessageDigest.getInstance(algo).digest(signature.toByteArray());
        } catch (NoSuchAlgorithmException ex) {
            loge("getCertHash NoSuchAlgorithmException " + ex);
            return null;
        }
    }

    private boolean matches(byte[] certHash, String packageName) {
        String[][] strArr = PACKAGENAME_SHA256SIG_PAIR;
        for (String[] pkgSsigP : strArr) {
            if (certHash != null && Arrays.equals(hexs2Bytes(pkgSsigP[1]), certHash) && !TextUtils.isEmpty(packageName) && packageName.equals(pkgSsigP[0])) {
                logd("matches return true");
                return true;
            }
        }
        loge("matches packageName = " + packageName + " certHashHex = " + bytes2Hexs(certHash) + ", hasSystemFeature() = " + this.mContext.getPackageManager().hasSystemFeature("com.verizon.feature.networklock"));
        return false;
    }

    private void sendErrorToCallback(Message msg) {
        CommandException ex = CommandException.fromRilErrno(2);
        RsuResponseInfo ret = new RsuResponseInfo();
        if (msg != null) {
            AsyncResult.forMessage(msg, ret, ex);
            msg.sendToTarget();
        }
    }

    private void loge(String s) {
        Rlog.e(TAG, "[RSU-SIMLOCK] " + s);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void logd(String s) {
        Rlog.d(TAG, "[RSU-SIMLOCK] " + s);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void logi(String s) {
        Rlog.i(TAG, "[RSU-SIMLOCK] " + s);
    }
}

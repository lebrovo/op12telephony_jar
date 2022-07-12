package com.mediatek.op12.telephony;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncResult;
import android.os.Handler;
import android.os.Message;
import android.os.PowerManager;
import android.os.Registrant;
import android.telephony.Rlog;
import android.telephony.SubscriptionManager;
import com.android.internal.telephony.CommandsInterface;
import com.mediatek.internal.telephony.MtkRIL;
import com.mediatek.internal.telephony.scbm.SCBMManagerDefault;
import com.mediatek.opcommon.telephony.MtkRilOp;

public class Op12SCBMManager extends SCBMManagerDefault {
    private static final boolean DBG = true;
    private static final int DEFAULT_SCM_EXIT_TIMER_VALUE = 300000;
    public static final String LOG_TAG = "Op12SCBMManager";
    public static final String PHONE_IN_SCM_STATE = "phoneinSCMState";
    private MtkRilOp mCi;
    private Context mContext;
    private Runnable mExitScmRunnable = new Runnable() {
        /* class com.mediatek.op12.telephony.Op12SCBMManager.AnonymousClass1 */

        public void run() {
            Op12SCBMManager.this.exitSCBM();
        }
    };
    protected boolean mIsPhoneInScmState = false;
    private int mPhoneId;
    private Registrant mScmExitRespRegistrant;
    protected PowerManager.WakeLock mWakeLock;

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: com.mediatek.op12.telephony.Op12SCBMManager */
    /* JADX WARN: Multi-variable type inference failed */
    public Op12SCBMManager(Context context, int phoneId, CommandsInterface ci) {
        super(context, phoneId, ci);
        Rlog.d(LOG_TAG, "Initialize Op12SCBMManager" + phoneId);
        this.mPhoneId = phoneId;
        this.mContext = context;
        this.mWakeLock = ((PowerManager) context.getSystemService("power")).newWakeLock(1, LOG_TAG);
        MtkRilOp rilOp = ((MtkRIL) ci).getRilOp();
        this.mCi = rilOp;
        rilOp.setSCBM(this, 1, (Object) null);
        this.mCi.registerForExitSCBM(this, 2, (Object) null);
    }

    public void handleMessage(Message msg) {
        int i = msg.what;
        if (i == 1) {
            handleEnterSCBM(msg);
        } else if (i != 2) {
            Op12SCBMManager.super.handleMessage(msg);
        } else {
            handleExitSCBM(msg);
        }
    }

    private void handleEnterSCBM(Message msg) {
        Rlog.d(LOG_TAG, "handleEnterSCBM, isInScm()=" + isInScm());
        if (isInScm()) {
            setIsInScm(false);
            removeCallbacks(this.mExitScmRunnable);
            if (this.mWakeLock.isHeld()) {
                this.mWakeLock.release();
            }
            sendSCBMChange();
        }
        setIsInScm(DBG);
        sendSCBMChange();
        postDelayed(this.mExitScmRunnable, 300000);
        this.mWakeLock.acquire();
    }

    public void exitSCBM() {
        if (this.mWakeLock.isHeld()) {
            this.mWakeLock.release();
        }
        this.mCi.exitSCBM((Message) null);
    }

    public boolean isInScm() {
        return this.mIsPhoneInScmState;
    }

    public void setIsInScm(boolean isInScm) {
        this.mIsPhoneInScmState = isInScm;
    }

    private void sendSCBMChange() {
        Intent intent = new Intent("com.mediatek.intent.action.ACTION_SCBM_CHANGED");
        intent.putExtra(PHONE_IN_SCM_STATE, isInScm());
        SubscriptionManager.putPhoneIdAndSubIdExtra(intent, this.mPhoneId);
        ActivityManager.broadcastStickyIntent(intent, -1);
        Rlog.d(LOG_TAG, "sendSCBMChange");
    }

    public void setOnScbModeExitResponse(Handler h, int what, Object obj) {
        this.mScmExitRespRegistrant = new Registrant(h, what, obj);
    }

    public void unsetOnScbModeExitResponse(Handler h) {
        this.mScmExitRespRegistrant.clear();
    }

    /* access modifiers changed from: protected */
    public void handleExitSCBM(Message msg) {
        AsyncResult ar = (AsyncResult) msg.obj;
        Rlog.d(LOG_TAG, "handleExitSCBM,ar.exception , isInScm=" + ar.exception + isInScm());
        removeCallbacks(this.mExitScmRunnable);
        Registrant registrant = this.mScmExitRespRegistrant;
        if (registrant != null) {
            registrant.notifyRegistrant(ar);
        }
        if (ar.exception == null) {
            if (isInScm()) {
                setIsInScm(false);
            }
            if (this.mWakeLock.isHeld()) {
                this.mWakeLock.release();
            }
            sendSCBMChange();
        }
    }
}

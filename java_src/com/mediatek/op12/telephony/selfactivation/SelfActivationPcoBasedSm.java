package com.mediatek.op12.telephony.selfactivation;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.radio.V1_0.LastCallFailCause;
import android.os.AsyncResult;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.os.SystemProperties;
import android.telephony.PcoData;
import android.telephony.PhoneStateListener;
import android.telephony.Rlog;
import android.telephony.SubscriptionInfo;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.widget.Toast;
import com.android.internal.util.State;
import com.android.internal.util.StateMachine;
import com.mediatek.internal.telephony.MtkSubscriptionManager;
import com.mediatek.internal.telephony.RadioManager;
import com.mediatek.internal.telephony.selfactivation.ISelfActivation;
import com.mediatek.internal.telephony.selfactivation.SelfActivationDefault;

public class SelfActivationPcoBasedSm extends SelfActivationDefault {
    public static final String ACTION_DEBUG_SELFACTIVATION = "mediatek.intent.action.DEBUG_SELFACTIVATION";
    private static final boolean DBG = true;
    public static final int DEBUG_ACTION_DUMP = 2;
    public static final int DEBUG_ACTION_NONE = 0;
    public static final int DEBUG_ACTION_PCO_EVENT = 4;
    public static final int DEBUG_ACTION_RADIO_CTRL = 3;
    public static final int DEBUG_ACTION_RESET = 1;
    public static final String KEY_DBG_ACTION = "dbg_action";
    public static final String KEY_DBG_PARAMETER = "dbg_param";
    private static final String OP12_BRANDED_DEVICE = "0";
    private static final int OPERATION_ADD_DATA_AGREE = 0;
    private static final int OPERATION_ADD_DATA_DECLINE = 1;
    private static final int OPERATION_MAKE_CALL = 2;
    private static final int PCO_DISABLE_RADIO_DELAY_MS = SystemProperties.getInt("persist.vendor.pco.delay", 0);
    private static final int PCO_DISABLE_RADIO_TIMER_MS = 300000;
    private static final int PCO_ID_FF00H = 65280;
    public static final int PCO_VALUE_DEFAULT = 0;
    public static final int PCO_VALUE_INVALID = -1;
    public static final int PCO_VALUE_SELF_ACT = 5;
    private static final String PROPERTY_OP12_DEVICE_MODEL = "persist.vendor.op12.model";
    public static final String PROPERTY_RADIO_CONTROL = "persist.vendor.pco5.radio.ctrl";
    private static final String PROP_VZW_DEVICE_TYPE = "persist.vendor.vzw_device_type";
    private static final String TAG = "SelfActivationPcoBasedSm";
    private PCO520State m520State = null;
    private SaCallState mCallState = null;
    private CallStateListener mCallStateListener = null;
    private DebugReceiver mDebugReceiver = new DebugReceiver(this);
    private boolean mEnableRadioControl = false;
    private boolean mInitRadioControl = false;
    private boolean mInitialized = false;
    private final SubscriptionManager.OnSubscriptionsChangedListener mOnSubInfoChangeListener = new SubscriptionManager.OnSubscriptionsChangedListener() {
        /* class com.mediatek.op12.telephony.selfactivation.SelfActivationPcoBasedSm.AnonymousClass1 */

        public void onSubscriptionsChanged() {
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.mSubId = MtkSubscriptionManager.getSubIdUsingPhoneId(selfActivationPcoBasedSm.mPhoneId);
            SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm2.regCallStateListener(selfActivationPcoBasedSm2.mSubId);
            SubscriptionInfo info = SelfActivationPcoBasedSm.this.mSubscriptionManager.getActiveSubscriptionInfo(SelfActivationPcoBasedSm.this.mSubId);
            if (info != null) {
                String newIccId = info.getIccId();
                if (!newIccId.isEmpty()) {
                    String currIccId = SaOp12PersistDataHelper.getStringData(SelfActivationPcoBasedSm.this.mContext, SelfActivationPcoBasedSm.this.mPhoneId, SaOp12PersistDataHelper.DATA_KEY_ICCID, "");
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm3 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm3.Rlogd("onSubscriptionsChanged currIccid: " + currIccId + " newIccId: " + newIccId);
                    if (!newIccId.equalsIgnoreCase(currIccId)) {
                        SaOp12PersistDataHelper.putStringData(SelfActivationPcoBasedSm.this.mContext, SelfActivationPcoBasedSm.this.mPhoneId, SaOp12PersistDataHelper.DATA_KEY_ICCID, newIccId);
                        SelfActivationPcoBasedSm.this.sendEvent(9);
                    }
                }
            }
        }
    };
    private SaRadioEnabledCause mRadioEnabledCause = null;
    private RadioManager mRadioManager = null;
    private SelfActivateState mSelfActivateState = null;
    private PcoStateMachine mStateMachine = null;
    private int mSubId = 0;
    private SubscriptionManager mSubscriptionManager = null;
    private TelephonyManager mTelephonyManager = null;

    public int selfActivationAction(int action, Bundle param) {
        Rlogd("selfActivationAction action: " + action);
        if (isInitialized()) {
            Message msg = this.mStateMachine.getHandler().obtainMessage(4);
            if (action == 0) {
                handleActionAddDataService(param, msg);
            } else if (action == 1) {
                handleActionMoCall(param, msg);
            } else if (action == 2) {
                updatePCO520State(false);
            } else {
                throw new IllegalArgumentException("Invalid action: " + action);
            }
            this.mStateMachine.getHandler().sendMessage(msg);
            return 0;
        }
        Rloge("selfActivationAction not ready! action: " + action);
        return -1;
    }

    public int getSelfActivateState() {
        if (isInitialized()) {
            return this.mSelfActivateState.getState();
        }
        Rloge("getSelfActivateState not ready!");
        return 0;
    }

    public int getPCO520State() {
        if (isInitialized()) {
            return this.m520State.getState();
        }
        Rloge("getPCO520State not ready!");
        return 0;
    }

    public ISelfActivation buildParams() {
        synchronized (this) {
            if (this.mContext == null || this.mCi == null) {
                throw new RuntimeException("SelfActivationPcoBasedSm is not initialized!");
            }
            init();
        }
        return this;
    }

    private void init() {
        this.mStateMachine = new PcoStateMachine(this.mPhoneId);
        this.mSubId = MtkSubscriptionManager.getSubIdUsingPhoneId(this.mPhoneId);
        this.mRadioEnabledCause = new SaRadioEnabledCause();
        this.mCallState = new SaCallState(this.mPhoneId);
        this.mSelfActivateState = new SelfActivateState(this.mPhoneId);
        this.m520State = new PCO520State(this.mPhoneId);
        this.mSubscriptionManager = SubscriptionManager.from(this.mContext);
        this.mEnableRadioControl = DBG;
        if ("1".equals(SystemProperties.get(PROPERTY_RADIO_CONTROL, OP12_BRANDED_DEVICE))) {
            this.mEnableRadioControl = DBG;
        } else {
            this.mEnableRadioControl = false;
        }
        this.mStateMachine.start();
        this.mInitialized = DBG;
        Rlog.d(TAG, toString());
    }

    private void handleActionAddDataService(Bundle param, Message msg) {
        if (param != null) {
            int operation = param.getInt("key_add_data_operation");
            if (operation == 0) {
                msg.arg1 = 1;
            } else if (operation == 1) {
                msg.arg1 = 0;
            } else {
                throw new IllegalArgumentException("Invalid operation: " + operation);
            }
        } else {
            throw new IllegalArgumentException("Null param");
        }
    }

    private void handleActionMoCall(Bundle param, Message msg) {
        if (param != null) {
            msg.arg1 = 2;
            int callType = param.getInt("key_mo_call_type");
            if (callType == 0) {
                msg.arg2 = 1;
            } else if (callType == 1) {
                msg.arg2 = 2;
            } else {
                throw new IllegalArgumentException("Invalid callType: " + callType);
            }
        } else {
            throw new IllegalArgumentException("Null param");
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void handlePcoEvent(Message msg) {
        AsyncResult ar = (AsyncResult) msg.obj;
        if (ar.exception != null) {
            Rloge("PCO_DATA exception: " + ar.exception);
            return;
        }
        PcoData pcoData = (PcoData) ar.result;
        if (pcoData == null) {
            Rloge("NULL PCO_DATA");
        } else if (PCO_ID_FF00H == pcoData.pcoId) {
            int newPcoValue = pcoData.contents[0] - 48;
            int currPcoValue = getPcoValue();
            Rlogd("handlePcoEvent(): PCO ID: " + pcoData.pcoId + ", newPcoValue: " + newPcoValue + ", currPcoValue: " + currPcoValue);
            if (newPcoValue != currPcoValue) {
                updatePcoValue(newPcoValue);
                updateSelfActivateState(newPcoValue);
                if (newPcoValue == 0 && currPcoValue == 5) {
                    updatePCO520State(DBG);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void handleNetworkRejectEvent(Message msg) {
        AsyncResult ar = (AsyncResult) msg.obj;
        if (ar.exception != null || ar.result == null) {
            Rloge("[handleNetworkRejectEvent] exception happeneds");
            return;
        }
        int[] ints = (int[]) ar.result;
        if (ints.length < 3) {
            Rloge("[handleNetworkRejectEvent] urc format error");
            return;
        }
        int emm_cause = ints[0];
        int esm_cause = ints[1];
        int event_type = ints[2];
        Rlogd("[handleNetworkRejectEvent] emm_cause:" + emm_cause + ", esm_cause:" + esm_cause + ", event_type:" + event_type);
        if (emm_cause == 8 && event_type == 1) {
            updatePcoValue(5);
        }
    }

    private boolean isInitialized() {
        return this.mInitialized;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private boolean isSelfActivatedPco() {
        if (5 == getPcoValue()) {
            return DBG;
        }
        return false;
    }

    private RadioManager getRadioManager() {
        if (this.mRadioManager == null) {
            this.mRadioManager = RadioManager.getInstance();
        }
        return this.mRadioManager;
    }

    public SelfActivationPcoBasedSm(int phoneId) {
        super(phoneId);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void registerEvents() {
        this.mCi.registerForAvailable(this.mStateMachine.getHandler(), 3, (Object) null);
        this.mCi.registerForRadioStateChanged(this.mStateMachine.getHandler(), 0, (Object) null);
        this.mCi.registerForPcoData(this.mStateMachine.getHandler(), 5, (Object) null);
        this.mCi.registerForPcoDataAfterAttached(this.mStateMachine.getHandler(), 5, (Object) null);
        this.mCi.registerForNetworkReject(this.mStateMachine.getHandler(), 10, (Object) null);
        this.mContext.registerReceiver(this.mDebugReceiver, new IntentFilter(ACTION_DEBUG_SELFACTIVATION));
        TelephonyManager telephonyManager = new TelephonyManager(this.mContext, this.mSubId);
        this.mTelephonyManager = telephonyManager;
        if (telephonyManager != null) {
            regCallStateListener(this.mSubId);
        }
        SubscriptionManager subscriptionManager = this.mSubscriptionManager;
        if (subscriptionManager != null) {
            subscriptionManager.addOnSubscriptionsChangedListener(this.mOnSubInfoChangeListener);
            Rlogd("registerEvents: Subscription info");
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void regCallStateListener(int subId) {
        CallStateListener callStateListener = this.mCallStateListener;
        if (callStateListener == null) {
            CallStateListener callStateListener2 = new CallStateListener(subId, this.mStateMachine.getHandler().getLooper());
            this.mCallStateListener = callStateListener2;
            this.mTelephonyManager.listen(callStateListener2, 32);
            Rlogd("regCallStateListener: create mCallStateListener with subId: " + subId);
        } else if (callStateListener.getSubId() != subId) {
            Rlogd("regCallStateListener: update mCallStateListener with subId old: " + this.mCallStateListener.getSubId() + " new: " + subId);
            this.mTelephonyManager.listen(this.mCallStateListener, 0);
            this.mTelephonyManager = new TelephonyManager(this.mContext, subId);
            CallStateListener callStateListener3 = new CallStateListener(subId, this.mStateMachine.getHandler().getLooper());
            this.mCallStateListener = callStateListener3;
            this.mTelephonyManager.listen(callStateListener3, 32);
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void deRegisterEvents() {
        this.mCi.unregisterForAvailable(this.mStateMachine.getHandler());
        this.mCi.unregisterForRadioStateChanged(this.mStateMachine.getHandler());
        this.mCi.unregisterForPcoData(this.mStateMachine.getHandler());
        this.mCi.unregisterForPcoDataAfterAttached(this.mStateMachine.getHandler());
        this.mCi.unregisterForNetworkReject(this.mStateMachine.getHandler());
        this.mContext.unregisterReceiver(this.mDebugReceiver);
        this.mTelephonyManager.listen(this.mCallStateListener, 0);
        this.mSubscriptionManager.removeOnSubscriptionsChangedListener(this.mOnSubInfoChangeListener);
    }

    /* access modifiers changed from: package-private */
    public class PcoStateMachine extends StateMachine {
        private SaBaseState mBaseState = new SaBaseState();
        private SaIdleState mIdleState = new SaIdleState();
        int mPhoneId = 0;
        private SaRadioDisabledState mRadioDisabledState = new SaRadioDisabledState();
        private SaRadioDisablingState mRadioDisablingState = new SaRadioDisablingState();
        private SaRadioEnabledState mRadioEnabledState = new SaRadioEnabledState();
        private SaRadioEnablingState mRadioEnablingState = new SaRadioEnablingState();

        public PcoStateMachine(int phoneId) {
            super("PcoStateMachine[" + phoneId + "]");
            this.mPhoneId = phoneId;
            addState(this.mBaseState);
            addState(this.mIdleState, this.mBaseState);
            addState(this.mRadioDisabledState, this.mBaseState);
            addState(this.mRadioEnablingState, this.mBaseState);
            addState(this.mRadioEnabledState, this.mBaseState);
            addState(this.mRadioDisablingState, this.mBaseState);
            setInitialState(this.mIdleState);
        }

        private class SaBaseState extends State {
            private SaBaseState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaBaseState: enter");
                SelfActivationPcoBasedSm.this.registerEvents();
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaBaseState: exit");
                SelfActivationPcoBasedSm.this.deRegisterEvents();
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                int i = msg.what;
                if (i == 0) {
                    int radioState = SelfActivationPcoBasedSm.this.mCi.getRadioState();
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm2.Rlogd("EVENT_RM_RADIO_CHANGED, state = " + radioState);
                    if (1 == radioState) {
                        SelfActivationPcoBasedSm.this.sendEvent(2);
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (radioState != 0) {
                        return SelfActivationPcoBasedSm.DBG;
                    } else {
                        SelfActivationPcoBasedSm.this.sendEvent(1);
                        return SelfActivationPcoBasedSm.DBG;
                    }
                } else if (i == 9) {
                    if (SelfActivationPcoBasedSm.this.isSelfActivatedPco()) {
                        SelfActivationPcoBasedSm.this.Rlogd("SIM CHANGED with !PCO_VALUE_SELF_ACT, try to enable radio");
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(4);
                        SelfActivationPcoBasedSm.this.mStateMachine.transitionTo(PcoStateMachine.this.mRadioEnablingState);
                    }
                    SelfActivationPcoBasedSm.this.resetPcoValue("SaBaseState: EVENT_SIM_STATE_CHANGED");
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 103) {
                    AsyncResult asyncResult = (AsyncResult) msg.obj;
                    if (asyncResult == null || asyncResult.exception != null) {
                        SelfActivationPcoBasedSm.this.Rloge("Sync radio control failed, forece enable!");
                        SelfActivationPcoBasedSm.this.mEnableRadioControl = SelfActivationPcoBasedSm.DBG;
                        return SelfActivationPcoBasedSm.DBG;
                    }
                    int enable = ((Integer) asyncResult.userObj).intValue();
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm3 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm3.Rlogd("Sync radio control: " + enable + " success");
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i != 3) {
                    if (i != 4) {
                        SelfActivationPcoBasedSm selfActivationPcoBasedSm4 = SelfActivationPcoBasedSm.this;
                        selfActivationPcoBasedSm4.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                        return false;
                    }
                    int operation = msg.arg1;
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm5 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm5.Rlogd("SaBaseState: EVENT_SELF_ACT with operation: " + operation);
                    if (operation == 0) {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(3);
                        SelfActivationPcoBasedSm.this.Rlogd("Remove SaEvents.EVENT_DISABLE_RADIO_PCO because user agree to add data service");
                        PcoStateMachine.this.getHandler().removeMessages(101);
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (operation == 1) {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.removeCause(3);
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (operation != 2) {
                        SelfActivationPcoBasedSm selfActivationPcoBasedSm6 = SelfActivationPcoBasedSm.this;
                        selfActivationPcoBasedSm6.Rloge("Unexpected operation: " + operation);
                        return SelfActivationPcoBasedSm.DBG;
                    } else {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(msg.arg2);
                        return SelfActivationPcoBasedSm.DBG;
                    }
                } else if (SelfActivationPcoBasedSm.this.mInitRadioControl) {
                    return SelfActivationPcoBasedSm.DBG;
                } else {
                    SelfActivationPcoBasedSm.this.syncRadioControlToMd(SelfActivationPcoBasedSm.this.mEnableRadioControl, "radio available");
                    SelfActivationPcoBasedSm.this.mInitRadioControl = SelfActivationPcoBasedSm.DBG;
                    return SelfActivationPcoBasedSm.DBG;
                }
            }
        }

        private class SaIdleState extends State {
            private SaIdleState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaIdleState: enter");
                SelfActivationPcoBasedSm.this.mRadioEnabledCause.setCause(0);
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaIdleState: exit");
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                int i = msg.what;
                if (i == 1) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i != 2) {
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm2.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                    return false;
                } else {
                    PcoStateMachine pcoStateMachine2 = PcoStateMachine.this;
                    pcoStateMachine2.transitionTo(pcoStateMachine2.mRadioEnabledState);
                    return SelfActivationPcoBasedSm.DBG;
                }
            }
        }

        /* access modifiers changed from: private */
        public class SaRadioDisabledState extends State {
            private SaRadioDisabledState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioDisabledState: enter");
                SelfActivationPcoBasedSm.this.mRadioEnabledCause.setCause(0);
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioDisabledState: exit");
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                int i = msg.what;
                if (i == 2) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioEnabledState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 4) {
                    int operation = msg.arg1;
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm2.Rlogd("SaRadioDisabledState: EVENT_SELF_ACT with operation: " + operation);
                    if (operation == 0) {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(3);
                        PcoStateMachine pcoStateMachine2 = PcoStateMachine.this;
                        pcoStateMachine2.transitionTo(pcoStateMachine2.mRadioEnablingState);
                        SelfActivationPcoBasedSm.this.Rlogd("Enable radio to add data service");
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (operation == 1) {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.removeCause(3);
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (operation != 2) {
                        SelfActivationPcoBasedSm selfActivationPcoBasedSm3 = SelfActivationPcoBasedSm.this;
                        selfActivationPcoBasedSm3.Rloge("Unexpected operation: " + operation);
                        return SelfActivationPcoBasedSm.DBG;
                    } else {
                        int cause = msg.arg2;
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(cause);
                        if (1 != cause) {
                            return SelfActivationPcoBasedSm.DBG;
                        }
                        PcoStateMachine pcoStateMachine3 = PcoStateMachine.this;
                        pcoStateMachine3.transitionTo(pcoStateMachine3.mRadioEnablingState);
                        SelfActivationPcoBasedSm.this.Rlogd("Enable radio to make call");
                        return SelfActivationPcoBasedSm.DBG;
                    }
                } else if (i == 104) {
                    SelfActivationPcoBasedSm.this.Rlogd("Reset! try to re-enable radio");
                    PcoStateMachine pcoStateMachine4 = PcoStateMachine.this;
                    pcoStateMachine4.transitionTo(pcoStateMachine4.mRadioEnablingState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 7 || i == 8) {
                    SelfActivationPcoBasedSm.this.Rlogd("defer call state message");
                    PcoStateMachine.this.deferMessage(msg);
                    return SelfActivationPcoBasedSm.DBG;
                } else {
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm4 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm4.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                    return false;
                }
            }
        }

        /* access modifiers changed from: private */
        public class SaRadioEnablingState extends State {
            private SaRadioEnablingState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioEnablingState: enter");
                if (2 == SelfActivationPcoBasedSm.this.setRadioPower(SelfActivationPcoBasedSm.DBG, 0)) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                }
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioEnablingState: exit");
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                int i = msg.what;
                if (i == 1) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 2) {
                    PcoStateMachine pcoStateMachine2 = PcoStateMachine.this;
                    pcoStateMachine2.transitionTo(pcoStateMachine2.mRadioEnabledState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 7 || i == 8) {
                    SelfActivationPcoBasedSm.this.Rlogd("defer call state message");
                    PcoStateMachine.this.deferMessage(msg);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i != 9) {
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm2.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                    return false;
                } else {
                    SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(4);
                    return SelfActivationPcoBasedSm.DBG;
                }
            }
        }

        /* access modifiers changed from: private */
        public class SaRadioEnabledState extends State {
            private SaRadioEnabledState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioEnabledState: enter");
                SelfActivationPcoBasedSm.this.disableRadioIfNeed();
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioEnabledState: exit");
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                int i = msg.what;
                if (i == 1) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 4) {
                    int operation = msg.arg1;
                    if (1 == operation) {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.removeCause(3);
                        SelfActivationPcoBasedSm.this.Rlogd("Disable radio because user decline to add data service");
                        SelfActivationPcoBasedSm.this.sendEvent(101);
                        return SelfActivationPcoBasedSm.DBG;
                    } else if (operation != 0) {
                        return SelfActivationPcoBasedSm.DBG;
                    } else {
                        SelfActivationPcoBasedSm.this.mRadioEnabledCause.addCause(3);
                        SelfActivationPcoBasedSm.this.Rlogd("Remove SaEvents.EVENT_DISABLE_RADIO_PCO because user agree to add data service");
                        PcoStateMachine.this.getHandler().removeMessages(101);
                        return SelfActivationPcoBasedSm.DBG;
                    }
                } else if (i == 5) {
                    SelfActivationPcoBasedSm.this.handlePcoEvent(msg);
                    SelfActivationPcoBasedSm.this.disableRadioIfNeed();
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i == 101) {
                    PcoStateMachine pcoStateMachine2 = PcoStateMachine.this;
                    pcoStateMachine2.transitionTo(pcoStateMachine2.mRadioDisablingState);
                    return SelfActivationPcoBasedSm.DBG;
                } else if (i != 102) {
                    switch (i) {
                        case 7:
                            SelfActivationPcoBasedSm.this.mCallState.incCallRefCount();
                            if (!SelfActivationPcoBasedSm.this.isStartCallEndTimer()) {
                                return SelfActivationPcoBasedSm.DBG;
                            }
                            SelfActivationPcoBasedSm.this.Rlogd("Stop timer by call start");
                            PcoStateMachine.this.getHandler().removeMessages(LastCallFailCause.RECOVERY_ON_TIMER_EXPIRED);
                            return SelfActivationPcoBasedSm.DBG;
                        case 8:
                            boolean lastCall = SelfActivationPcoBasedSm.this.mCallState.decCallRefCount();
                            if (!SelfActivationPcoBasedSm.this.isSelfActivatedPco() || !lastCall) {
                                return SelfActivationPcoBasedSm.DBG;
                            }
                            SelfActivationPcoBasedSm.this.Rlogd("Start timer by call end");
                            PcoStateMachine.this.getHandler().sendEmptyMessageDelayed(LastCallFailCause.RECOVERY_ON_TIMER_EXPIRED, 300000);
                            return SelfActivationPcoBasedSm.DBG;
                        case 9:
                            SelfActivationPcoBasedSm.this.Rlogd("Stay in radio enabled state");
                            return SelfActivationPcoBasedSm.DBG;
                        case 10:
                            SelfActivationPcoBasedSm.this.handleNetworkRejectEvent(msg);
                            SelfActivationPcoBasedSm.this.disableRadioIfNeed();
                            return SelfActivationPcoBasedSm.DBG;
                        default:
                            SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                            selfActivationPcoBasedSm2.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                            return false;
                    }
                } else {
                    SelfActivationPcoBasedSm.this.disableRadioCallEndTimer();
                    return SelfActivationPcoBasedSm.DBG;
                }
            }
        }

        /* access modifiers changed from: private */
        public class SaRadioDisablingState extends State {
            private SaRadioDisablingState() {
            }

            public void enter() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioDisablingState: enter");
                if (7 == SelfActivationPcoBasedSm.this.setRadioPower(false, 1)) {
                    PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                    pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                    SelfActivationPcoBasedSm.this.Rlogd("radio already off!");
                }
            }

            public void exit() {
                SelfActivationPcoBasedSm.this.Rlogd("SaRadioDisablingState: exit");
            }

            public boolean processMessage(Message msg) {
                SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                selfActivationPcoBasedSm.Rlogd(getName() + ": processMessage msg = " + SaEvents.print(msg.what));
                if (msg.what != 1) {
                    SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                    selfActivationPcoBasedSm2.Rlogd("not-handled msg.what: " + SaEvents.print(msg.what));
                    return false;
                }
                PcoStateMachine pcoStateMachine = PcoStateMachine.this;
                pcoStateMachine.transitionTo(pcoStateMachine.mRadioDisabledState);
                return SelfActivationPcoBasedSm.DBG;
            }
        }
    }

    /* access modifiers changed from: package-private */
    public class CallStateListener extends PhoneStateListener {
        private int mSubId = -1;

        public CallStateListener(int subId, Looper looper) {
            super(looper);
            this.mSubId = subId;
        }

        public int getSubId() {
            return this.mSubId;
        }

        public void onCallStateChanged(int state, String phoneNumber) {
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.Rlogd("onCallStateChanged: " + state);
            if (state == 0) {
                SelfActivationPcoBasedSm.this.sendEvent(8);
            } else if (state == 2) {
                SelfActivationPcoBasedSm.this.sendEvent(7);
            }
        }
    }

    /* access modifiers changed from: private */
    public class DebugReceiver extends BroadcastReceiver {
        private SelfActivationPcoBasedSm mSaSmInstance = null;

        public DebugReceiver(SelfActivationPcoBasedSm saSmInstance) {
            this.mSaSmInstance = saSmInstance;
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(SelfActivationPcoBasedSm.ACTION_DEBUG_SELFACTIVATION)) {
                int subId = intent.getIntExtra("subscription", -1);
                boolean z = false;
                int debugAction = intent.getIntExtra(SelfActivationPcoBasedSm.KEY_DBG_ACTION, 0);
                if (debugAction != 1) {
                    if (debugAction == 2) {
                        SelfActivationPcoBasedSm.this.Rlogd(this.mSaSmInstance.toString());
                        Toast.makeText(context, SelfActivationPcoBasedSm.this.mStateMachine.getCurrentState().getName(), 0).show();
                    } else if (debugAction == 3) {
                        int ctrl = intent.getIntExtra(SelfActivationPcoBasedSm.KEY_DBG_PARAMETER, 0);
                        SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
                        if (ctrl == 1) {
                            z = true;
                        }
                        selfActivationPcoBasedSm.mEnableRadioControl = z;
                        SelfActivationPcoBasedSm.this.Rlogd("Enable radio control: " + SelfActivationPcoBasedSm.this.mEnableRadioControl);
                        SelfActivationPcoBasedSm selfActivationPcoBasedSm2 = SelfActivationPcoBasedSm.this;
                        selfActivationPcoBasedSm2.syncRadioControlToMd(selfActivationPcoBasedSm2.mEnableRadioControl, "debug");
                    } else if (debugAction != 4) {
                        SelfActivationPcoBasedSm.this.Rloge("Unknow debug action: " + debugAction);
                    } else {
                        int pco = intent.getIntExtra(SelfActivationPcoBasedSm.KEY_DBG_PARAMETER, -1);
                        AsyncResult ar = new AsyncResult((Object) null, new PcoData(0, "IPV4", (int) SelfActivationPcoBasedSm.PCO_ID_FF00H, new byte[]{(byte) pco}), (Throwable) null);
                        Message msg = SelfActivationPcoBasedSm.this.mStateMachine.getHandler().obtainMessage(5);
                        msg.obj = ar;
                        SelfActivationPcoBasedSm.this.Rlogd("DEBUG_ACTION_PCO_EVENT with PCO FF00H: " + pco);
                        SelfActivationPcoBasedSm.this.mStateMachine.getHandler().sendMessage(msg);
                    }
                } else if (-1 == subId) {
                    SelfActivationPcoBasedSm.this.Rlogd("Reset selfactivation state");
                    SelfActivationPcoBasedSm.this.resetPcoValue("ACTION_RESET_SELFACTIVATION");
                    SelfActivationPcoBasedSm.this.sendEvent(104);
                } else if (SelfActivationPcoBasedSm.this.mSubId == subId) {
                    SelfActivationPcoBasedSm.this.Rlogd("Reset selfactivation state with subId: " + subId);
                    SelfActivationPcoBasedSm.this.resetPcoValue("ACTION_RESET_SELFACTIVATION");
                    SelfActivationPcoBasedSm.this.sendEvent(104);
                }
            }
        }
    }

    private void updateSelfActivateState(int pcoValue) {
        if (pcoValue == 0) {
            this.mSelfActivateState.setState(0);
        } else if (pcoValue != 5) {
            this.mSelfActivateState.setState(-1);
            Rloge("Unknown PCO value: " + pcoValue);
        } else {
            this.mSelfActivateState.setState(2);
        }
        Rlogd("updateSelfActivateState: pcoValue = " + pcoValue + ", state = " + this.mSelfActivateState);
    }

    private void updatePCO520State(boolean flag) {
        if (flag) {
            this.m520State.setState(1);
        } else {
            this.m520State.setState(0);
        }
        Rlogd("updatePCO520State: flag = " + flag + ", state = " + this.m520State);
    }

    private int getPcoValue() {
        return SaOp12PersistDataHelper.getIntData(this.mContext, this.mPhoneId, SaOp12PersistDataHelper.DATA_KEY_PCO, 0);
    }

    private void updatePcoValue(int value) {
        SaOp12PersistDataHelper.putIntData(this.mContext, this.mPhoneId, SaOp12PersistDataHelper.DATA_KEY_PCO, value);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void resetPcoValue(String cause) {
        Rlogd("resetPcoValue cause: " + cause);
        SaOp12PersistDataHelper.putIntData(this.mContext, this.mPhoneId, SaOp12PersistDataHelper.DATA_KEY_PCO, 0);
        updateSelfActivateState(0);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private int setRadioPower(boolean power, int reason) {
        int retVal = getRadioManager().setRadioPower(power, this.mPhoneId, reason);
        Rlogd("setRadioPower(" + power + "), ret = " + retVal);
        return retVal;
    }

    public String toString() {
        StringBuilder s = new StringBuilder();
        s.append("SelfActivationPcoBasedSm{");
        s.append(" mPhoneId = " + this.mPhoneId);
        s.append(", mSubId = " + this.mSubId);
        s.append(", curState = " + this.mStateMachine.getCurrentState().getName());
        s.append(", mRadioEnabledCause = " + this.mRadioEnabledCause);
        s.append(", PersistDataHelper = " + SaOp12PersistDataHelper.toString(this.mContext, this.mPhoneId));
        s.append(", mCallState = " + this.mCallState);
        s.append(", mSelfActivateState = " + this.mSelfActivateState);
        s.append(", m520State = " + this.m520State);
        s.append("}");
        return s.toString();
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void disableRadioIfNeed() {
        boolean isSelfActPco = 5 == getPcoValue();
        isOp12BrandedDevice();
        Rlogd("disableRadioIfNeed: isSelfActPco = " + isSelfActPco + ", getCallRefCount = " + this.mCallState.getCallRefCount() + ", isStartCallEndTimer = " + isStartCallEndTimer() + ", " + this.mRadioEnabledCause + ", mEnableRadioControl = " + this.mEnableRadioControl);
        if (isSelfActPco && !isStartCallEndTimer() && this.mCallState.getCallRefCount() == 0 && this.mEnableRadioControl && !this.mRadioEnabledCause.hasCause(3) && !this.mRadioEnabledCause.hasCause(1) && !this.mRadioEnabledCause.hasCause(2)) {
            sendEventDelayed(101, (long) PCO_DISABLE_RADIO_DELAY_MS);
            Rlogd("disableRadioIfNeed: true");
        }
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private boolean isStartCallEndTimer() {
        if (this.mStateMachine.getHandler().hasMessages(LastCallFailCause.RECOVERY_ON_TIMER_EXPIRED)) {
            return DBG;
        }
        return false;
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void disableRadioCallEndTimer() {
        boolean isSelfActPco = 5 == getPcoValue() ? DBG : false;
        Rlogd("disableRadioCallEndTimer: isSelfActPco = " + isSelfActPco + ", mRadioEnabledCause = " + this.mRadioEnabledCause + ", mEnableRadioControl = " + this.mEnableRadioControl);
        if (isSelfActPco && this.mEnableRadioControl && !this.mRadioEnabledCause.hasCause(3)) {
            sendEvent(101);
            Rlogd("disableRadioCallEndTimer: true");
        }
    }

    /* access modifiers changed from: protected */
    public void Rloge(String s) {
        Rlog.e("SelfActivationPcoBasedSm[" + this.mPhoneId + "]", s);
    }

    /* access modifiers changed from: protected */
    public void Rlogd(String s) {
        Rlog.d("SelfActivationPcoBasedSm[" + this.mPhoneId + "]", s);
    }

    private void sendEvent(int event, int arg1) {
        Rlogd("sendEvent: " + SaEvents.print(event));
        Message msg = Message.obtain(this.mStateMachine.getHandler(), event);
        msg.arg1 = arg1;
        this.mStateMachine.getHandler().sendMessage(msg);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void sendEvent(int event) {
        Rlogd("sendEvent: " + SaEvents.print(event));
        this.mStateMachine.getHandler().sendMessage(Message.obtain(this.mStateMachine.getHandler(), event));
    }

    private void sendEventDelayed(int event, long delayMillis) {
        Rlogd("sendEventDelayed: " + SaEvents.print(event) + " with delay: " + delayMillis);
        this.mStateMachine.getHandler().sendMessageDelayed(Message.obtain(this.mStateMachine.getHandler(), event), delayMillis);
    }

    /* access modifiers changed from: private */
    /* access modifiers changed from: public */
    private void syncRadioControlToMd(boolean enableRadioControl, String cause) {
        Rlogd("syncRadioControlToMd() enableRadioControl: " + enableRadioControl + " cause: " + cause);
        int enable = 2;
        String[] cmd = new String[2];
        if (!enableRadioControl) {
            enable = 1;
        }
        cmd[0] = "AT+ESELFACT=\"radioctrl\",\"" + enable + "\"";
        cmd[1] = "";
        this.mCi.invokeOemRilRequestStrings(cmd, this.mStateMachine.getHandler().obtainMessage(103, Integer.valueOf(enable)));
    }

    /* access modifiers changed from: package-private */
    public class SaCallState {
        private int mCallRefCount = 0;
        private int mPhoneId = 0;

        SaCallState(int phoneId) {
            this.mPhoneId = phoneId;
        }

        /* access modifiers changed from: package-private */
        public int getCallRefCount() {
            return this.mCallRefCount;
        }

        /* access modifiers changed from: package-private */
        public boolean incCallRefCount() {
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.Rlogd("incCallRefCount: " + this.mCallRefCount + " > " + (this.mCallRefCount + 1));
            int i = this.mCallRefCount + 1;
            this.mCallRefCount = i;
            if (i == 1) {
                return SelfActivationPcoBasedSm.DBG;
            }
            return false;
        }

        /* access modifiers changed from: package-private */
        public boolean decCallRefCount() {
            if (this.mCallRefCount <= 0) {
                return false;
            }
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.Rlogd("decCallRefCount: " + this.mCallRefCount + " > " + (this.mCallRefCount - 1));
            int i = this.mCallRefCount - 1;
            this.mCallRefCount = i;
            if (i == 0) {
                return SelfActivationPcoBasedSm.DBG;
            }
            return false;
        }

        /* access modifiers changed from: package-private */
        public void resetCallRefCount() {
            this.mCallRefCount = 0;
        }

        public String toString() {
            return "SaCallState{ mPhoneId = " + this.mPhoneId + " mCallRefCount = " + this.mCallRefCount + "}";
        }
    }

    /* access modifiers changed from: package-private */
    public class SelfActivateState {
        private int mPhoneId;
        private int mState;

        public SelfActivateState(int phoneId) {
            this.mPhoneId = phoneId;
            int saved = SaOp12PersistDataHelper.getIntData(SelfActivationPcoBasedSm.this.mContext, this.mPhoneId, "dataKeySaState", -1);
            if (saved != -1) {
                this.mState = saved;
            } else {
                setState(0);
            }
        }

        /* access modifiers changed from: package-private */
        public void setState(int state) {
            this.mState = state;
            SaOp12PersistDataHelper.putIntData(SelfActivationPcoBasedSm.this.mContext, this.mPhoneId, "dataKeySaState", this.mState);
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.Rlogd("setState: " + print(this.mState));
        }

        /* access modifiers changed from: package-private */
        public int getState() {
            return this.mState;
        }

        /* access modifiers changed from: package-private */
        public String print(int state) {
            if (state == 0) {
                return "STATE_NONE";
            }
            if (state == 1) {
                return "STATE_ACTIVATED";
            }
            if (state != 2) {
                return "STATE_UNKNOWN";
            }
            return "STATE_NOT_ACTIVATED";
        }

        public String toString() {
            return "SelfActivateState{ mPhoneId = " + this.mPhoneId + " mState = " + print(this.mState) + " mEnableRadioControl = " + SelfActivationPcoBasedSm.this.mEnableRadioControl + "}";
        }
    }

    /* access modifiers changed from: package-private */
    public class PCO520State {
        private int m520State;
        private int mPhoneId;

        public PCO520State(int phoneId) {
            this.mPhoneId = phoneId;
            int saved = SaOp12PersistDataHelper.getIntData(SelfActivationPcoBasedSm.this.mContext, this.mPhoneId, "dataKeySaState", -1);
            if (saved != -1) {
                this.m520State = saved;
            } else {
                setState(0);
            }
        }

        /* access modifiers changed from: package-private */
        public void setState(int state) {
            this.m520State = state;
            SaOp12PersistDataHelper.putIntData(SelfActivationPcoBasedSm.this.mContext, this.mPhoneId, "dataKeySaState", this.m520State);
            SelfActivationPcoBasedSm selfActivationPcoBasedSm = SelfActivationPcoBasedSm.this;
            selfActivationPcoBasedSm.Rlogd("set520State: " + print(this.m520State));
        }

        /* access modifiers changed from: package-private */
        public int getState() {
            return this.m520State;
        }

        /* access modifiers changed from: package-private */
        public String print(int state) {
            if (state == 0) {
                return "520_NONE";
            }
            if (state != 1) {
                return "520_UNKNOWN";
            }
            return "520_ACTIVATED";
        }

        public String toString() {
            return "SelfActivateState{ mPhoneId = " + this.mPhoneId + " m520State = " + print(this.m520State) + " mEnableRadioControl = " + SelfActivationPcoBasedSm.this.mEnableRadioControl + "}";
        }
    }

    /* access modifiers changed from: package-private */
    public static class SaEvents {
        static final int EVENT_CALL_STATE_IDLE = 8;
        static final int EVENT_CALL_STATE_START = 7;
        static final int EVENT_DBG_RESET = 104;
        static final int EVENT_DISABLE_RADIO_PCO = 101;
        static final int EVENT_EXTERNAL_START = 0;
        static final int EVENT_INTERNAL_START = 100;
        static final int EVENT_NETWORK_REJECT = 10;
        static final int EVENT_PCO_STATE = 5;
        static final int EVENT_RM_RADIO_AVAILABLE = 3;
        static final int EVENT_RM_RADIO_CHANGED = 0;
        static final int EVENT_RM_RADIO_OFF = 1;
        static final int EVENT_RM_RADIO_ON = 2;
        static final int EVENT_SELF_ACT = 4;
        static final int EVENT_SIM_STATE_CHANGED = 9;
        static final int EVENT_SYNC_RADIO_CTRL_DONE = 103;
        static final int EVENT_TIMER_RADIO_OFF = 102;

        SaEvents() {
        }

        public static String print(int eventCode) {
            if (eventCode == 0) {
                return "EVENT_RM_RADIO_CHANGED";
            }
            if (eventCode == 1) {
                return "EVENT_RM_RADIO_OFF";
            }
            if (eventCode == 2) {
                return "EVENT_RM_RADIO_ON";
            }
            if (eventCode == 3) {
                return "EVENT_RM_RADIO_AVAILABLE";
            }
            if (eventCode == 4) {
                return "EVENT_SELF_ACT";
            }
            if (eventCode == 5) {
                return "EVENT_PCO_STATE";
            }
            switch (eventCode) {
                case 7:
                    return "EVENT_CALL_STATE_START";
                case 8:
                    return "EVENT_CALL_STATE_IDLE";
                case 9:
                    return "EVENT_SIM_STATE_CHANGED";
                case 10:
                    return "EVENT_NETWORK_REJECT";
                default:
                    switch (eventCode) {
                        case 101:
                            return "EVENT_DISABLE_RADIO_PCO";
                        case 102:
                            return "EVENT_TIMER_RADIO_OFF";
                        case EVENT_SYNC_RADIO_CTRL_DONE /*{ENCODED_INT: 103}*/:
                            return "EVENT_SYNC_RADIO_CTRL_DONE";
                        case EVENT_DBG_RESET /*{ENCODED_INT: 104}*/:
                            return "EVENT_DBG_RESET";
                        default:
                            throw new IllegalArgumentException("Invalid eventCode: " + eventCode);
                    }
            }
        }
    }

    public static boolean isOp12BrandedDevice() {
        if (OP12_BRANDED_DEVICE.equalsIgnoreCase(SystemProperties.get(PROPERTY_OP12_DEVICE_MODEL))) {
            return DBG;
        }
        return false;
    }
}

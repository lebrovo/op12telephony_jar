.class public Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.super Lcom/mediatek/internal/telephony/selfactivation/SelfActivationDefault;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
    }
.end annotation


# static fields
.field public static final ACTION_DEBUG_SELFACTIVATION:Ljava/lang/String; = "mediatek.intent.action.DEBUG_SELFACTIVATION"

.field private static final DBG:Z = true

.field public static final DEBUG_ACTION_DUMP:I = 0x2

.field public static final DEBUG_ACTION_NONE:I = 0x0

.field public static final DEBUG_ACTION_PCO_EVENT:I = 0x4

.field public static final DEBUG_ACTION_RADIO_CTRL:I = 0x3

.field public static final DEBUG_ACTION_RESET:I = 0x1

.field public static final KEY_DBG_ACTION:Ljava/lang/String; = "dbg_action"

.field public static final KEY_DBG_PARAMETER:Ljava/lang/String; = "dbg_param"

.field private static final OP12_BRANDED_DEVICE:Ljava/lang/String; = "0"

.field private static final OPERATION_ADD_DATA_AGREE:I = 0x0

.field private static final OPERATION_ADD_DATA_DECLINE:I = 0x1

.field private static final OPERATION_MAKE_CALL:I = 0x2

.field private static final PCO_DISABLE_RADIO_DELAY_MS:I

.field private static final PCO_DISABLE_RADIO_TIMER_MS:I = 0x493e0

.field private static final PCO_ID_FF00H:I = 0xff00

.field public static final PCO_VALUE_DEFAULT:I = 0x0

.field public static final PCO_VALUE_INVALID:I = -0x1

.field public static final PCO_VALUE_SELF_ACT:I = 0x5

.field private static final PROPERTY_OP12_DEVICE_MODEL:Ljava/lang/String; = "persist.vendor.op12.model"

.field public static final PROPERTY_RADIO_CONTROL:Ljava/lang/String; = "persist.vendor.pco5.radio.ctrl"

.field private static final PROP_VZW_DEVICE_TYPE:Ljava/lang/String; = "persist.vendor.vzw_device_type"

.field private static final TAG:Ljava/lang/String; = "SelfActivationPcoBasedSm"


# instance fields
.field private m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

.field private mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

.field private mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

.field private mDebugReceiver:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;

.field private mEnableRadioControl:Z

.field private mInitRadioControl:Z

.field private mInitialized:Z

.field private final mOnSubInfoChangeListener:Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;

.field private mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

.field private mRadioManager:Lcom/mediatek/internal/telephony/RadioManager;

.field private mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

.field private mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

.field private mSubId:I

.field private mSubscriptionManager:Landroid/telephony/SubscriptionManager;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 127
    nop

    .line 128
    const-string v0, "persist.vendor.pco.delay"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->PCO_DISABLE_RADIO_DELAY_MS:I

    .line 127
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "phoneId"    # I

    .line 336
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/selfactivation/SelfActivationDefault;-><init>(I)V

    .line 103
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    .line 104
    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitialized:Z

    .line 105
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 106
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 107
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    .line 108
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    .line 109
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    .line 110
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioManager:Lcom/mediatek/internal/telephony/RadioManager;

    .line 111
    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    .line 112
    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitRadioControl:Z

    .line 115
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    .line 116
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 117
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;

    invoke-direct {v0, p0, p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mDebugReceiver:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;

    .line 118
    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    .line 784
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;

    invoke-direct {v0, p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mOnSubInfoChangeListener:Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;

    .line 337
    return-void
.end method

.method static synthetic access$1000(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->syncRadioControlToMd(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isSelfActivatedPco()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Ljava/lang/String;

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->resetPcoValue(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/android/internal/telephony/CommandsInterface;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # I

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->sendEvent(I)V

    return-void
.end method

.method static synthetic access$2000(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ZI)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Z
    .param p2, "x2"    # I

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->setRadioPower(ZI)I

    move-result v0

    return v0
.end method

.method static synthetic access$2100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->disableRadioIfNeed()V

    return-void
.end method

.method static synthetic access$2200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Landroid/os/Message;

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->handlePcoEvent(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isStartCallEndTimer()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->disableRadioCallEndTimer()V

    return-void
.end method

.method static synthetic access$2700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Landroid/os/Message;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Landroid/os/Message;

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->handleNetworkRejectEvent(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    return v0
.end method

.method static synthetic access$2802(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)I
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # I

    .line 72
    iput p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    return p1
.end method

.method static synthetic access$2900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    return v0
.end method

.method static synthetic access$3000(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # I

    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->regCallStateListener(I)V

    return-void
.end method

.method static synthetic access$3100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/telephony/SubscriptionManager;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    return v0
.end method

.method static synthetic access$3400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    return v0
.end method

.method static synthetic access$3600(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->registerEvents()V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->deRegisterEvents()V

    return-void
.end method

.method static synthetic access$800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitRadioControl:Z

    return v0
.end method

.method static synthetic access$802(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Z

    .line 72
    iput-boolean p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitRadioControl:Z

    return p1
.end method

.method static synthetic access$900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 72
    iget-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    return v0
.end method

.method static synthetic access$902(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p1, "x1"    # Z

    .line 72
    iput-boolean p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    return p1
.end method

.method private deRegisterEvents()V
    .locals 3

    .line 392
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForAvailable(Landroid/os/Handler;)V

    .line 393
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForRadioStateChanged(Landroid/os/Handler;)V

    .line 394
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForPcoData(Landroid/os/Handler;)V

    .line 395
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    check-cast v0, Lcom/mediatek/internal/telephony/MtkRIL;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/internal/telephony/MtkRIL;->unregisterForPcoDataAfterAttached(Landroid/os/Handler;)V

    .line 396
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    check-cast v0, Lcom/mediatek/internal/telephony/MtkRIL;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/internal/telephony/MtkRIL;->unregisterForNetworkReject(Landroid/os/Handler;)V

    .line 397
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mDebugReceiver:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 398
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 399
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mOnSubInfoChangeListener:Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;

    invoke-virtual {v0, v1}, Landroid/telephony/SubscriptionManager;->removeOnSubscriptionsChangedListener(Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;)V

    .line 400
    return-void
.end method

.method private disableRadioCallEndTimer()V
    .locals 4

    .line 965
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->getPcoValue()I

    move-result v0

    .line 966
    .local v0, "currPcoValue":I
    const/4 v1, 0x5

    if-ne v1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 967
    .local v1, "isSelfActPco":Z
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disableRadioCallEndTimer: isSelfActPco = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", mRadioEnabledCause = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", mEnableRadioControl = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 970
    if-eqz v1, :cond_1

    iget-boolean v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    const/4 v3, 0x3

    .line 972
    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->hasCause(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 973
    const/16 v2, 0x65

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->sendEvent(I)V

    .line 974
    const-string v2, "disableRadioCallEndTimer: true"

    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 976
    :cond_1
    return-void
.end method

.method private disableRadioIfNeed()V
    .locals 6

    .line 936
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->getPcoValue()I

    move-result v0

    .line 937
    .local v0, "currPcoValue":I
    const/4 v1, 0x1

    const/4 v2, 0x5

    if-ne v2, v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 938
    .local v2, "isSelfActPco":Z
    :goto_0
    invoke-static {}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isOp12BrandedDevice()Z

    move-result v3

    .line 939
    .local v3, "isOp12BrandedDevice":Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "disableRadioIfNeed: isSelfActPco = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, ", getCallRefCount = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    .line 940
    invoke-virtual {v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->getCallRefCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", isStartCallEndTimer = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isStartCallEndTimer()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", mEnableRadioControl = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 939
    invoke-virtual {p0, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 944
    if-eqz v2, :cond_1

    .line 945
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isStartCallEndTimer()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    .line 946
    invoke-virtual {v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->getCallRefCount()I

    move-result v4

    if-nez v4, :cond_1

    iget-boolean v4, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    const/4 v5, 0x3

    .line 948
    invoke-virtual {v4, v5}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->hasCause(I)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 949
    invoke-virtual {v4, v1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->hasCause(I)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    const/4 v4, 0x2

    .line 950
    invoke-virtual {v1, v4}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->hasCause(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 952
    const/16 v1, 0x65

    sget v4, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->PCO_DISABLE_RADIO_DELAY_MS:I

    int-to-long v4, v4

    invoke-direct {p0, v1, v4, v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->sendEventDelayed(IJ)V

    .line 953
    const-string v1, "disableRadioIfNeed: true"

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 955
    :cond_1
    return-void
.end method

.method private getPcoValue()I
    .locals 4

    .line 895
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    const-string v2, "dataKeyPco"

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->getIntData(Landroid/content/Context;ILjava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getRadioManager()Lcom/mediatek/internal/telephony/RadioManager;
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioManager:Lcom/mediatek/internal/telephony/RadioManager;

    if-nez v0, :cond_0

    .line 330
    invoke-static {}, Lcom/mediatek/internal/telephony/RadioManager;->getInstance()Lcom/mediatek/internal/telephony/RadioManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioManager:Lcom/mediatek/internal/telephony/RadioManager;

    .line 332
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioManager:Lcom/mediatek/internal/telephony/RadioManager;

    return-object v0
.end method

.method private handleActionAddDataService(Landroid/os/Bundle;Landroid/os/Message;)V
    .locals 4
    .param p1, "param"    # Landroid/os/Bundle;
    .param p2, "msg"    # Landroid/os/Message;

    .line 219
    if-eqz p1, :cond_2

    .line 220
    const-string v0, "key_add_data_operation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 221
    .local v0, "operation":I
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    if-ne v0, v1, :cond_0

    .line 226
    const/4 v1, 0x0

    iput v1, p2, Landroid/os/Message;->arg1:I

    .line 227
    goto :goto_0

    .line 229
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 223
    :cond_1
    iput v1, p2, Landroid/os/Message;->arg1:I

    .line 224
    nop

    .line 231
    .end local v0    # "operation":I
    :goto_0
    nop

    .line 234
    return-void

    .line 232
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null param"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private handleActionMoCall(Landroid/os/Bundle;Landroid/os/Message;)V
    .locals 4
    .param p1, "param"    # Landroid/os/Bundle;
    .param p2, "msg"    # Landroid/os/Message;

    .line 237
    if-eqz p1, :cond_2

    .line 238
    const/4 v0, 0x2

    iput v0, p2, Landroid/os/Message;->arg1:I

    .line 239
    const-string v1, "key_mo_call_type"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 240
    .local v1, "callType":I
    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    .line 245
    iput v0, p2, Landroid/os/Message;->arg2:I

    .line 246
    goto :goto_0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid callType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 242
    :cond_1
    iput v2, p2, Landroid/os/Message;->arg2:I

    .line 243
    nop

    .line 250
    .end local v1    # "callType":I
    :goto_0
    nop

    .line 253
    return-void

    .line 251
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Null param"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private handleNetworkRejectEvent(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .line 287
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 288
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v1, :cond_3

    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-nez v1, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, [I

    .line 302
    .local v1, "ints":[I
    array-length v2, v1

    const/4 v3, 0x3

    if-ge v2, v3, :cond_1

    .line 303
    const-string v2, "[handleNetworkRejectEvent] urc format error"

    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 304
    return-void

    .line 306
    :cond_1
    const/4 v2, 0x0

    aget v2, v1, v2

    .line 307
    .local v2, "emm_cause":I
    const/4 v3, 0x1

    aget v4, v1, v3

    .line 308
    .local v4, "esm_cause":I
    const/4 v5, 0x2

    aget v5, v1, v5

    .line 309
    .local v5, "event_type":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[handleNetworkRejectEvent] emm_cause:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", esm_cause:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", event_type:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 313
    const/16 v6, 0x8

    if-ne v2, v6, :cond_2

    if-ne v5, v3, :cond_2

    .line 314
    const/4 v3, 0x5

    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updatePcoValue(I)V

    .line 317
    :cond_2
    return-void

    .line 289
    .end local v1    # "ints":[I
    .end local v2    # "emm_cause":I
    .end local v4    # "esm_cause":I
    .end local v5    # "event_type":I
    :cond_3
    :goto_0
    const-string v1, "[handleNetworkRejectEvent] exception happeneds"

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 290
    return-void
.end method

.method private handlePcoEvent(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .line 256
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 257
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PCO_DATA exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 259
    return-void

    .line 262
    :cond_0
    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Landroid/telephony/PcoData;

    .line 263
    .local v1, "pcoData":Landroid/telephony/PcoData;
    if-nez v1, :cond_1

    .line 264
    const-string v2, "NULL PCO_DATA"

    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 265
    return-void

    .line 268
    :cond_1
    const v2, 0xff00

    iget v3, v1, Landroid/telephony/PcoData;->pcoId:I

    if-ne v2, v3, :cond_2

    .line 271
    iget-object v2, v1, Landroid/telephony/PcoData;->contents:[B

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    add-int/lit8 v2, v2, -0x30

    .line 272
    .local v2, "newPcoValue":I
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->getPcoValue()I

    move-result v3

    .line 273
    .local v3, "currPcoValue":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handlePcoEvent(): PCO ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Landroid/telephony/PcoData;->pcoId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", newPcoValue: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", currPcoValue: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 277
    if-eq v2, v3, :cond_2

    .line 278
    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updatePcoValue(I)V

    .line 280
    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updateSelfActivateState(I)V

    .line 281
    if-nez v2, :cond_2

    const/4 v4, 0x5

    if-ne v3, v4, :cond_2

    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updatePCO520State(Z)V

    .line 284
    .end local v2    # "newPcoValue":I
    .end local v3    # "currPcoValue":I
    :cond_2
    return-void
.end method

.method private init()V
    .locals 3

    .line 194
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 195
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-static {v0}, Lcom/mediatek/internal/telephony/MtkSubscriptionManager;->getSubIdUsingPhoneId(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    .line 196
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    invoke-direct {v0}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;-><init>()V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 197
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    .line 198
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    .line 199
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    .line 200
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    .line 206
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    .line 207
    const-string v1, "persist.vendor.pco5.radio.ctrl"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    goto :goto_0

    .line 210
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mEnableRadioControl:Z

    .line 213
    :goto_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->start()V

    .line 214
    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitialized:Z

    .line 215
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SelfActivationPcoBasedSm"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    return-void
.end method

.method private isInitialized()Z
    .locals 1

    .line 320
    iget-boolean v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mInitialized:Z

    return v0
.end method

.method public static isOp12BrandedDevice()Z
    .locals 2

    .line 1213
    nop

    .line 1214
    const-string v0, "persist.vendor.op12.model"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1213
    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1214
    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1213
    :goto_0
    return v0
.end method

.method private isSelfActivatedPco()Z
    .locals 2

    .line 324
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->getPcoValue()I

    move-result v0

    .line 325
    .local v0, "currPcoValue":I
    const/4 v1, 0x5

    if-ne v1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isStartCallEndTimer()Z
    .locals 2

    .line 958
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 959
    const/4 v0, 0x1

    return v0

    .line 961
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private regCallStateListener(I)V
    .locals 4
    .param p1, "subId"    # I

    .line 373
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    const/16 v1, 0x20

    if-nez v0, :cond_0

    .line 374
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 375
    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, p0, p1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ILandroid/os/Looper;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    .line 376
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2, v0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 377
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "regCallStateListener: create mCallStateListener with subId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    goto :goto_0

    .line 378
    :cond_0
    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->getSubId()I

    move-result v0

    if-eq v0, p1, :cond_1

    .line 379
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "regCallStateListener: update mCallStateListener with subId old: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    .line 380
    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->getSubId()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " new: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 379
    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 381
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 382
    new-instance v0, Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2, p1}, Landroid/telephony/TelephonyManager;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 383
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 384
    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, p0, p1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ILandroid/os/Looper;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallStateListener:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;

    .line 385
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v2, v0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 389
    :cond_1
    :goto_0
    return-void
.end method

.method private registerEvents()V
    .locals 4

    .line 340
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 343
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForRadioStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 346
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x5

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForPcoData(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 347
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    check-cast v0, Lcom/mediatek/internal/telephony/MtkRIL;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/internal/telephony/MtkRIL;->registerForPcoDataAfterAttached(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 351
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    check-cast v0, Lcom/mediatek/internal/telephony/MtkRIL;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/internal/telephony/MtkRIL;->registerForNetworkReject(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 354
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "mediatek.intent.action.DEBUG_SELFACTIVATION"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 356
    .local v0, "debugIntentFilter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mDebugReceiver:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 359
    new-instance v1, Landroid/telephony/TelephonyManager;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    invoke-direct {v1, v2, v3}, Landroid/telephony/TelephonyManager;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 360
    if-eqz v1, :cond_0

    .line 361
    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->regCallStateListener(I)V

    .line 364
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubscriptionManager:Landroid/telephony/SubscriptionManager;

    if-eqz v1, :cond_1

    .line 365
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mOnSubInfoChangeListener:Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;

    invoke-virtual {v1, v2}, Landroid/telephony/SubscriptionManager;->addOnSubscriptionsChangedListener(Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;)V

    .line 366
    const-string v1, "registerEvents: Subscription info"

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 368
    :cond_1
    return-void
.end method

.method private resetPcoValue(Ljava/lang/String;)V
    .locals 4
    .param p1, "cause"    # Ljava/lang/String;

    .line 905
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resetPcoValue cause: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 906
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    const-string v2, "dataKeyPco"

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->putIntData(Landroid/content/Context;ILjava/lang/String;I)V

    .line 908
    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updateSelfActivateState(I)V

    .line 909
    return-void
.end method

.method private sendEvent(I)V
    .locals 2
    .param p1, "event"    # I

    .line 996
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendEvent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;->print(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 997
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 998
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 999
    return-void
.end method

.method private sendEvent(II)V
    .locals 2
    .param p1, "event"    # I
    .param p2, "arg1"    # I

    .line 989
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendEvent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;->print(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 990
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 991
    .local v0, "msg":Landroid/os/Message;
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 992
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 993
    return-void
.end method

.method private sendEventDelayed(IJ)V
    .locals 2
    .param p1, "event"    # I
    .param p2, "delayMillis"    # J

    .line 1002
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendEventDelayed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;->print(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " with delay: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 1003
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 1004
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1005
    return-void
.end method

.method private setRadioPower(ZI)I
    .locals 3
    .param p1, "power"    # Z
    .param p2, "reason"    # I

    .line 912
    const/4 v0, 0x0

    .line 913
    .local v0, "retVal":I
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->getRadioManager()Lcom/mediatek/internal/telephony/RadioManager;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-virtual {v1, p1, v2, p2}, Lcom/mediatek/internal/telephony/RadioManager;->setRadioPower(ZII)I

    move-result v0

    .line 914
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setRadioPower("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "), ret = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 915
    return v0
.end method

.method private syncRadioControlToMd(ZLjava/lang/String;)V
    .locals 6
    .param p1, "enableRadioControl"    # Z
    .param p2, "cause"    # Ljava/lang/String;

    .line 1007
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "syncRadioControlToMd() enableRadioControl: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " cause: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 1009
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    .line 1010
    .local v1, "cmd":[Ljava/lang/String;
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    .line 1011
    .local v0, "enable":I
    :goto_0
    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AT+ESELFACT=\"radioctrl\",\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 1013
    const-string v3, ""

    aput-object v3, v1, v2

    .line 1014
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0x67

    .line 1015
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1014
    invoke-virtual {v2, v3, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 1016
    .local v2, "result":Landroid/os/Message;
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    check-cast v3, Lcom/mediatek/internal/telephony/MtkRIL;

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/internal/telephony/MtkRIL;->invokeOemRilRequestStrings([Ljava/lang/String;Landroid/os/Message;)V

    .line 1017
    return-void
.end method

.method private updatePCO520State(Z)V
    .locals 2
    .param p1, "flag"    # Z

    .line 886
    if-eqz p1, :cond_0

    .line 887
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->setState(I)V

    goto :goto_0

    .line 889
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->setState(I)V

    .line 890
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updatePCO520State: flag = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 893
    return-void
.end method

.method private updatePcoValue(I)V
    .locals 3
    .param p1, "value"    # I

    .line 900
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    const-string v2, "dataKeyPco"

    invoke-static {v0, v1, v2, p1}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->putIntData(Landroid/content/Context;ILjava/lang/String;I)V

    .line 902
    return-void
.end method

.method private updateSelfActivateState(I)V
    .locals 2
    .param p1, "pcoValue"    # I

    .line 867
    if-eqz p1, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 876
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;->setState(I)V

    .line 877
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown PCO value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    goto :goto_0

    .line 869
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;->setState(I)V

    .line 870
    goto :goto_0

    .line 872
    :cond_1
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;->setState(I)V

    .line 873
    nop

    .line 880
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateSelfActivateState: pcoValue = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 883
    return-void
.end method


# virtual methods
.method protected Rlogd(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 984
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SelfActivationPcoBasedSm["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    return-void
.end method

.method protected Rloge(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 979
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SelfActivationPcoBasedSm["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 980
    return-void
.end method

.method public buildParams()Lcom/mediatek/internal/telephony/selfactivation/ISelfActivation;
    .locals 2

    .line 182
    monitor-enter p0

    .line 183
    :try_start_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    if-eqz v0, :cond_0

    .line 186
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->init()V

    .line 187
    monitor-exit p0

    .line 188
    return-object p0

    .line 184
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "SelfActivationPcoBasedSm is not initialized!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local p0    # "this":Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    throw v0

    .line 187
    .restart local p0    # "this":Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getPCO520State()I
    .locals 2

    .line 172
    const/4 v0, 0x0

    .line 173
    .local v0, "state":I
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 174
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->getState()I

    move-result v0

    goto :goto_0

    .line 176
    :cond_0
    const-string v1, "getPCO520State not ready!"

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 178
    :goto_0
    return v0
.end method

.method public getSelfActivateState()I
    .locals 2

    .line 161
    const/4 v0, 0x0

    .line 162
    .local v0, "state":I
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;->getState()I

    move-result v0

    goto :goto_0

    .line 165
    :cond_0
    const-string v1, "getSelfActivateState not ready!"

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 167
    :goto_0
    return v0
.end method

.method public selfActivationAction(ILandroid/os/Bundle;)I
    .locals 5
    .param p1, "action"    # I
    .param p2, "param"    # Landroid/os/Bundle;

    .line 133
    const/4 v0, 0x0

    .line 134
    .local v0, "ret":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "selfActivationAction action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 136
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 137
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 138
    .local v1, "msg":Landroid/os/Message;
    if-eqz p1, :cond_2

    const/4 v2, 0x1

    if-eq p1, v2, :cond_1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    .line 146
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->updatePCO520State(Z)V

    .line 147
    goto :goto_0

    .line 149
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid action: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 143
    :cond_1
    invoke-direct {p0, p2, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->handleActionMoCall(Landroid/os/Bundle;Landroid/os/Message;)V

    .line 144
    goto :goto_0

    .line 140
    :cond_2
    invoke-direct {p0, p2, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->handleActionAddDataService(Landroid/os/Bundle;Landroid/os/Message;)V

    .line 141
    nop

    .line 151
    :goto_0
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 152
    .end local v1    # "msg":Landroid/os/Message;
    goto :goto_1

    .line 153
    :cond_3
    const/4 v0, -0x1

    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "selfActivationAction not ready! action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 156
    :goto_1
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 920
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 921
    .local v0, "s":Ljava/lang/StringBuilder;
    const-string v1, "SelfActivationPcoBasedSm{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 922
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mPhoneId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 923
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", mSubId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSubId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 924
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", curState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mStateMachine:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 925
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", mRadioEnabledCause = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mRadioEnabledCause:Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 926
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", PersistDataHelper = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mPhoneId:I

    invoke-static {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->toString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", mCallState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mCallState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 928
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", mSelfActivateState = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->mSelfActivateState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SelfActivateState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 929
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", m520State = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->m520State:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 930
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 932
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

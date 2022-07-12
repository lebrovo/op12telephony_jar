.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
.super Lcom/android/internal/util/StateMachine;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PcoStateMachine"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;,
        Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;
    }
.end annotation


# instance fields
.field private mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

.field private mIdleState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;

.field mPhoneId:I

.field private mRadioDisabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

.field private mRadioDisablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

.field private mRadioEnabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

.field private mRadioEnablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method public constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V
    .locals 2
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p2, "phoneId"    # I

    .line 412
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 413
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PcoStateMachine["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;)V

    .line 403
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mPhoneId:I

    .line 405
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    .line 406
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mIdleState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;

    .line 407
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

    .line 408
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    .line 409
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

    .line 410
    new-instance v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

    invoke-direct {v0, p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

    .line 414
    iput p2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mPhoneId:I

    .line 415
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;)V

    .line 416
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mIdleState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 417
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 418
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 419
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 420
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mBaseState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaBaseState;

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 421
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mIdleState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaIdleState;

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->setInitialState(Lcom/android/internal/util/State;)V

    .line 422
    return-void
.end method

.method static synthetic access$1300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 402
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 402
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioEnabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 402
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisabledState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    .line 402
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->mRadioDisablingState:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

    return-object v0
.end method

.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;
.super Lcom/android/internal/util/State;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaRadioDisabledState"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;


# direct methods
.method private constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)V
    .locals 0

    .line 539
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
    .param p2, "x1"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;

    .line 539
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)V

    return-void
.end method


# virtual methods
.method public enter()V
    .locals 2

    .line 542
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v1, "SaRadioDisabledState: enter"

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 543
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->setCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 544
    return-void
.end method

.method public exit()V
    .locals 2

    .line 547
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v1, "SaRadioDisabledState: exit"

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 548
    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .line 551
    const/4 v0, 0x1

    .line 552
    .local v0, "retVal":Z
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": processMessage msg = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;->print(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 553
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_6

    const/4 v3, 0x4

    if-eq v1, v3, :cond_2

    const/16 v2, 0x68

    if-eq v1, v2, :cond_1

    const/4 v2, 0x7

    if-eq v1, v2, :cond_0

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    .line 599
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not-handled msg.what: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;->print(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 600
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 590
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v2, "defer call state message"

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 591
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->deferMessage(Landroid/os/Message;)V

    .line 592
    goto/16 :goto_0

    .line 594
    :cond_1
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v2, "Reset! try to re-enable radio"

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 595
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$1300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 596
    goto/16 :goto_0

    .line 558
    :cond_2
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 559
    .local v1, "operation":I
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v3, v3, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SaRadioDisabledState: EVENT_SELF_ACT with operation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 560
    const/4 v3, 0x3

    if-eqz v1, :cond_5

    const/4 v4, 0x1

    if-eq v1, v4, :cond_4

    if-eq v1, v2, :cond_3

    .line 583
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected operation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    .line 584
    goto :goto_0

    .line 572
    :cond_3
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 573
    .local v2, "cause":I
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v3, v3, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->addCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 577
    if-ne v4, v2, :cond_7

    .line 578
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$1300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 579
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v3, v3, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v4, "Enable radio to make call"

    invoke-virtual {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    goto :goto_0

    .line 568
    .end local v2    # "cause":I
    :cond_4
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->removeCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 570
    goto :goto_0

    .line 562
    :cond_5
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->addCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 564
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$1300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnablingState;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 565
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v3, "Enable radio to add data service"

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 566
    goto :goto_0

    .line 555
    .end local v1    # "operation":I
    :cond_6
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$1800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 556
    nop

    .line 603
    :cond_7
    :goto_0
    return v0
.end method

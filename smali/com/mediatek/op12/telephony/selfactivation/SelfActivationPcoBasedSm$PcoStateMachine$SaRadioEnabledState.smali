.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;
.super Lcom/android/internal/util/State;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaRadioEnabledState"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;


# direct methods
.method private constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)V
    .locals 0

    .line 648
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;
    .param p2, "x1"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;

    .line 648
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;-><init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)V

    return-void
.end method


# virtual methods
.method public enter()V
    .locals 2

    .line 651
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v1, "SaRadioEnabledState: enter"

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 652
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    .line 653
    return-void
.end method

.method public exit()V
    .locals 2

    .line 656
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v0, v0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v1, "SaRadioEnabledState: exit"

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 657
    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .line 660
    const/4 v0, 0x1

    .line 661
    .local v0, "retVal":Z
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->getName()Ljava/lang/String;

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

    .line 662
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5

    const/4 v3, 0x4

    const/16 v4, 0x65

    if-eq v1, v3, :cond_3

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    if-eq v1, v4, :cond_1

    const/16 v2, 0x66

    if-eq v1, v2, :cond_0

    packed-switch v1, :pswitch_data_0

    .line 716
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

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

    .line 717
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 712
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Landroid/os/Message;)V

    .line 713
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    .line 714
    goto/16 :goto_0

    .line 694
    :pswitch_1
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v2, "Stay in radio enabled state"

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 695
    goto/16 :goto_0

    .line 678
    :pswitch_2
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->decCallRefCount()Z

    move-result v1

    .line 679
    .local v1, "lastCall":Z
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v3, v3, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 680
    if-eqz v1, :cond_6

    .line 681
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v3, v3, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v4, "Start timer by call end"

    invoke-virtual {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 682
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v3

    const-wide/32 v4, 0x493e0

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 671
    .end local v1    # "lastCall":Z
    :pswitch_3
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->incCallRefCount()Z

    .line 672
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 673
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v3, "Stop timer by call start"

    invoke-virtual {v1, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 674
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 688
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    .line 689
    goto :goto_0

    .line 691
    :cond_1
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$2600(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisablingState;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 692
    goto :goto_0

    .line 667
    :cond_2
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Landroid/os/Message;)V

    .line 668
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v1, v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V

    .line 669
    goto :goto_0

    .line 697
    :cond_3
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 698
    .local v1, "operation":I
    const/4 v3, 0x3

    if-ne v2, v1, :cond_4

    .line 699
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->removeCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 701
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v3, "Disable radio because user decline to add data service"

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 702
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v2, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    goto :goto_0

    .line 703
    :cond_4
    if-nez v1, :cond_6

    .line 704
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->addCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;

    .line 706
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v3, "Remove SaEvents.EVENT_DISABLE_RADIO_PCO because user agree to add data service"

    invoke-virtual {v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 708
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-virtual {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_0

    .line 664
    .end local v1    # "operation":I
    :cond_5
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioEnabledState;->this$1:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->access$1900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine$SaRadioDisabledState;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    .line 665
    nop

    .line 720
    :cond_6
    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DebugReceiver"
.end annotation


# instance fields
.field private mSaSmInstance:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method public constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p2, "saSmInstance"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 813
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 811
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->mSaSmInstance:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 814
    iput-object p2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->mSaSmInstance:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 815
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 819
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mediatek.intent.action.DEBUG_SELFACTIVATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 820
    const-string v0, "subscription"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 822
    .local v0, "subId":I
    const-string v2, "dbg_action"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 823
    .local v2, "debugAction":I
    const/4 v4, 0x1

    if-eq v2, v4, :cond_4

    const/4 v5, 0x2

    if-eq v2, v5, :cond_3

    const/4 v5, 0x3

    const-string v6, "dbg_param"

    if-eq v2, v5, :cond_1

    const/4 v5, 0x4

    if-eq v2, v5, :cond_0

    .line 859
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknow debug action: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rloge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 848
    :cond_0
    invoke-virtual {p2, v6, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 849
    .local v1, "pco":I
    new-array v4, v4, [B

    .line 850
    .local v4, "content":[B
    int-to-byte v5, v1

    aput-byte v5, v4, v3

    .line 851
    new-instance v5, Landroid/telephony/PcoData;

    const v6, 0xff00

    const-string v7, "IPV4"

    invoke-direct {v5, v3, v7, v6, v4}, Landroid/telephony/PcoData;-><init>(ILjava/lang/String;I[B)V

    move-object v3, v5

    .line 852
    .local v3, "pcoData":Landroid/telephony/PcoData;
    new-instance v5, Landroid/os/AsyncResult;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v3, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 853
    .local v5, "ar":Landroid/os/AsyncResult;
    iget-object v6, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v6}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v6

    const/4 v7, 0x5

    invoke-virtual {v6, v7}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    .line 854
    .local v6, "msg":Landroid/os/Message;
    iput-object v5, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 855
    iget-object v7, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "DEBUG_ACTION_PCO_EVENT with PCO FF00H: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 856
    iget-object v7, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v7}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 857
    goto/16 :goto_0

    .line 842
    .end local v1    # "pco":I
    .end local v3    # "pcoData":Landroid/telephony/PcoData;
    .end local v4    # "content":[B
    .end local v5    # "ar":Landroid/os/AsyncResult;
    .end local v6    # "msg":Landroid/os/Message;
    :cond_1
    invoke-virtual {p2, v6, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 843
    .local v1, "ctrl":I
    iget-object v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    if-ne v1, v4, :cond_2

    move v3, v4

    :cond_2
    invoke-static {v5, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$902(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Z)Z

    .line 844
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Enable radio control: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 845
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z

    move-result v4

    const-string v5, "debug"

    invoke-static {v3, v4, v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1000(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ZLjava/lang/String;)V

    .line 846
    goto :goto_0

    .line 836
    .end local v1    # "ctrl":I
    :cond_3
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    iget-object v4, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->mSaSmInstance:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-virtual {v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 837
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 838
    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PcoStateMachine;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/util/IState;->getName()Ljava/lang/String;

    move-result-object v1

    .line 837
    invoke-static {p1, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 839
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 840
    goto :goto_0

    .line 825
    :cond_4
    const/16 v3, 0x68

    const-string v4, "ACTION_RESET_SELFACTIVATION"

    if-ne v1, v0, :cond_5

    .line 826
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const-string v5, "Reset selfactivation state"

    invoke-virtual {v1, v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 827
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Ljava/lang/String;)V

    .line 828
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    goto :goto_0

    .line 829
    :cond_5
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v1

    if-ne v1, v0, :cond_6

    .line 830
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Reset selfactivation state with subId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 831
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;Ljava/lang/String;)V

    .line 832
    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$DebugReceiver;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1, v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    .line 863
    .end local v0    # "subId":I
    .end local v2    # "debugAction":I
    :cond_6
    :goto_0
    return-void
.end method

.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;
.super Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 785
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-direct {p0}, Landroid/telephony/SubscriptionManager$OnSubscriptionsChangedListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onSubscriptionsChanged()V
    .locals 7

    .line 788
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/MtkSubscriptionManager;->getSubIdUsingPhoneId(I)I

    move-result v1

    invoke-static {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2802(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)I

    .line 789
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3000(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    .line 790
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3100(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/telephony/SubscriptionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$2800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfo(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v0

    .line 791
    .local v0, "info":Landroid/telephony/SubscriptionInfo;
    if-eqz v0, :cond_0

    .line 792
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getIccId()Ljava/lang/String;

    move-result-object v1

    .line 793
    .local v1, "newIccId":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 794
    iget-object v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 795
    invoke-static {v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3200(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3300(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v3

    const-string v4, "dataKeyIccId"

    const-string v5, ""

    invoke-static {v2, v3, v4, v5}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->getStringData(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 797
    .local v2, "currIccId":Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onSubscriptionsChanged currIccid: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " newIccId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 798
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 799
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v3}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3400(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;

    move-result-object v3

    iget-object v5, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v5}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3500(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)I

    move-result v5

    invoke-static {v3, v5, v4, v1}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->putStringData(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;)V

    .line 801
    iget-object v3, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$1;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const/16 v4, 0x9

    invoke-static {v3, v4}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    .line 807
    .end local v1    # "newIccId":Ljava/lang/String;
    .end local v2    # "currIccId":Ljava/lang/String;
    :cond_0
    return-void
.end method

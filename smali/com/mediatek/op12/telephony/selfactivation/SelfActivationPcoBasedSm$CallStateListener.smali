.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CallStateListener"
.end annotation


# instance fields
.field private mSubId:I

.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method public constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;ILandroid/os/Looper;)V
    .locals 1
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p2, "subId"    # I
    .param p3, "looper"    # Landroid/os/Looper;

    .line 759
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 760
    invoke-direct {p0, p3}, Landroid/telephony/PhoneStateListener;-><init>(Landroid/os/Looper;)V

    .line 757
    const/4 v0, -0x1

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->mSubId:I

    .line 761
    iput p2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->mSubId:I

    .line 762
    return-void
.end method


# virtual methods
.method public getSubId()I
    .locals 1

    .line 765
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->mSubId:I

    return v0
.end method

.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 3
    .param p1, "state"    # I
    .param p2, "phoneNumber"    # Ljava/lang/String;

    .line 770
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCallStateChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 771
    if-eqz p1, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 773
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const/4 v1, 0x7

    invoke-static {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    .line 774
    goto :goto_0

    .line 776
    :cond_1
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$CallStateListener;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$1700(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V

    .line 777
    nop

    .line 781
    :goto_0
    return-void
.end method

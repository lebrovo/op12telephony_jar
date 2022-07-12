.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;
.super Ljava/lang/Object;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PCO520State"
.end annotation


# instance fields
.field private m520State:I

.field private mPhoneId:I

.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method public constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V
    .locals 4
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p2, "phoneId"    # I

    .line 1123
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1124
    iput p2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->mPhoneId:I

    .line 1125
    invoke-static {p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3800(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->mPhoneId:I

    const-string v2, "dataKeySaState"

    const/4 v3, -0x1

    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->getIntData(Landroid/content/Context;ILjava/lang/String;I)I

    move-result v0

    .line 1127
    .local v0, "saved":I
    if-eq v0, v3, :cond_0

    .line 1128
    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    goto :goto_0

    .line 1130
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->setState(I)V

    .line 1132
    :goto_0
    return-void
.end method


# virtual methods
.method getState()I
    .locals 1

    .line 1142
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    return v0
.end method

.method print(I)Ljava/lang/String;
    .locals 2
    .param p1, "state"    # I

    .line 1146
    const-string v0, ""

    .line 1147
    .local v0, "outString":Ljava/lang/String;
    if-eqz p1, :cond_1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    .line 1152
    const-string v0, "520_UNKNOWN"

    goto :goto_0

    .line 1149
    :cond_0
    const-string v0, "520_ACTIVATED"

    goto :goto_0

    .line 1148
    :cond_1
    const-string v0, "520_NONE"

    .line 1154
    :goto_0
    return-object v0
.end method

.method setState(I)V
    .locals 4
    .param p1, "state"    # I

    .line 1135
    iput p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    .line 1136
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-static {v0}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$3900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->mPhoneId:I

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    const-string v3, "dataKeySaState"

    invoke-static {v0, v1, v3, v2}, Lcom/mediatek/op12/telephony/selfactivation/SaOp12PersistDataHelper;->putIntData(Landroid/content/Context;ILjava/lang/String;I)V

    .line 1138
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set520State: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->print(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 1139
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SelfActivateState{ mPhoneId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->mPhoneId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " m520State = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->m520State:I

    .line 1160
    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->print(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " mEnableRadioControl = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$PCO520State;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    .line 1161
    invoke-static {v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->access$900(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1159
    return-object v0
.end method

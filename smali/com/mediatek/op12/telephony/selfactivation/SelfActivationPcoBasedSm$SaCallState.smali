.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;
.super Ljava/lang/Object;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SaCallState"
.end annotation


# instance fields
.field private mCallRefCount:I

.field private mPhoneId:I

.field final synthetic this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;


# direct methods
.method constructor <init>(Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;I)V
    .locals 1
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
    .param p2, "phoneId"    # I

    .line 1034
    iput-object p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1031
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mPhoneId:I

    .line 1032
    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    .line 1035
    iput p2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mPhoneId:I

    .line 1036
    return-void
.end method


# virtual methods
.method decCallRefCount()Z
    .locals 4

    .line 1051
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    if-lez v0, :cond_0

    .line 1052
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "decCallRefCount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 1053
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    .line 1054
    if-nez v0, :cond_0

    .line 1055
    return v3

    .line 1058
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method getCallRefCount()I
    .locals 1

    .line 1039
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    return v0
.end method

.method incCallRefCount()Z
    .locals 4

    .line 1044
    iget-object v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->this$0:Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "incCallRefCount: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;->Rlogd(Ljava/lang/String;)V

    .line 1045
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    .line 1046
    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method resetCallRefCount()V
    .locals 1

    .line 1062
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    .line 1063
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1067
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SaCallState{ mPhoneId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mPhoneId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mCallRefCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaCallState;->mCallRefCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

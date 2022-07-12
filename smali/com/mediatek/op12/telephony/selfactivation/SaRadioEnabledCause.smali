.class public Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;
.super Ljava/lang/Object;
.source "SaRadioEnabledCause.java"


# static fields
.field static final CAUSE_ADD_DATA_SERVICE:I = 0x3

.field static final CAUSE_EMERGENCY_CALL:I = 0x2

.field static final CAUSE_NONE:I = 0x0

.field static final CAUSE_NORMAL_CALL:I = 0x1

.field static final CAUSE_SIM_CHANGED:I = 0x4

.field static final MAX_CAUSE:I = 0x4

.field static final MIN_CAUSE:I


# instance fields
.field private mRadioEnabledCause:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    return-void
.end method

.method private enforceValidCause(I)V
    .locals 3
    .param p1, "cause"    # I

    .line 75
    if-ltz p1, :cond_0

    const/4 v0, 0x4

    if-gt p1, v0, :cond_0

    .line 78
    return-void

    .line 76
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid radio enabled cause: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private enumerateBits(J)[I
    .locals 8
    .param p1, "val"    # J

    .line 85
    invoke-static {p1, p2}, Ljava/lang/Long;->bitCount(J)I

    move-result v0

    .line 86
    .local v0, "size":I
    new-array v1, v0, [I

    .line 87
    .local v1, "result":[I
    const/4 v2, 0x0

    .line 88
    .local v2, "index":I
    const/4 v3, 0x0

    .line 89
    .local v3, "resource":I
    :goto_0
    const-wide/16 v4, 0x0

    cmp-long v4, p1, v4

    if-lez v4, :cond_1

    .line 90
    const-wide/16 v4, 0x1

    and-long v6, p1, v4

    cmp-long v4, v6, v4

    if-nez v4, :cond_0

    add-int/lit8 v4, v2, 0x1

    .end local v2    # "index":I
    .local v4, "index":I
    aput v3, v1, v2

    move v2, v4

    .line 91
    .end local v4    # "index":I
    .restart local v2    # "index":I
    :cond_0
    const/4 v4, 0x1

    shr-long/2addr p1, v4

    .line 92
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 94
    :cond_1
    return-object v1
.end method


# virtual methods
.method public addCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;
    .locals 2
    .param p1, "cause"    # I

    .line 58
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->enforceValidCause(I)V

    .line 59
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    or-int/2addr v0, v1

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    .line 60
    return-object p0
.end method

.method public getRadioEnabledCauses()[I
    .locals 2

    .line 81
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->enumerateBits(J)[I

    move-result-object v0

    return-object v0
.end method

.method public hasCause(I)Z
    .locals 3
    .param p1, "cause"    # I

    .line 70
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->enforceValidCause(I)V

    .line 71
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    const/4 v1, 0x1

    shl-int v2, v1, p1

    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public removeCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;
    .locals 2
    .param p1, "cause"    # I

    .line 64
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->enforceValidCause(I)V

    .line 65
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    not-int v1, v1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    .line 66
    return-object p0
.end method

.method public setCause(I)Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;
    .locals 0
    .param p1, "cause"    # I

    .line 52
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->enforceValidCause(I)V

    .line 53
    iput p1, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    .line 54
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 99
    iget v0, p0, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->mRadioEnabledCause:I

    if-nez v0, :cond_0

    .line 100
    const-string v0, "RadioEnabledCause: CAUSE_NONE"

    return-object v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/selfactivation/SaRadioEnabledCause;->getRadioEnabledCauses()[I

    move-result-object v0

    .line 103
    .local v0, "types":[I
    array-length v1, v0

    if-lez v1, :cond_1

    const-string v1, "RadioEnabledCause: "

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 104
    .local v1, "causes":Ljava/lang/String;
    :goto_0
    const/4 v2, 0x0

    .local v2, "i":I
    :cond_2
    :goto_1
    array-length v3, v0

    if-ge v2, v3, :cond_7

    .line 105
    aget v3, v0, v2

    const/4 v4, 0x1

    if-eq v3, v4, :cond_6

    const/4 v4, 0x2

    if-eq v3, v4, :cond_5

    const/4 v4, 0x3

    if-eq v3, v4, :cond_4

    const/4 v4, 0x4

    if-eq v3, v4, :cond_3

    goto :goto_2

    .line 109
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "SIM_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 108
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "ADD_DATA_SERVICE"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 107
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "EMERGENCY_CALL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 106
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "NORMAL_CALL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 111
    :goto_2
    add-int/lit8 v2, v2, 0x1

    array-length v3, v0

    if-ge v2, v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 113
    .end local v2    # "i":I
    :cond_7
    return-object v1
.end method

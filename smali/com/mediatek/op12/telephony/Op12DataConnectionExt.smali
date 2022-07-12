.class public Lcom/mediatek/op12/telephony/Op12DataConnectionExt;
.super Lcom/mediatek/internal/telephony/dataconnection/DataConnectionExt;
.source "Op12DataConnectionExt.java"


# static fields
.field static final TAG:Ljava/lang/String; = "Op12DataConnectionExt"


# instance fields
.field private mIsPcoAllowedDefault:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 62
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/dataconnection/DataConnectionExt;-><init>(Landroid/content/Context;)V

    .line 182
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->mIsPcoAllowedDefault:Z

    .line 63
    return-void
.end method

.method private apnMatcher(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1, "apn"    # Ljava/lang/String;
    .param p2, "compareApn"    # Ljava/lang/String;

    .line 153
    const/4 v0, 0x0

    .line 154
    .local v0, "ret":Z
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "Op12DataConnectionExt"

    if-ge v1, v2, :cond_0

    .line 155
    const-string v1, "apnMatcher: length not match."

    invoke-static {v3, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    return v0

    .line 159
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "tmpApn":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 162
    .local v2, "tmpCompareApn":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, -0x1

    if-eqz v4, :cond_1

    :goto_0
    goto :goto_1

    :cond_1
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-eq v4, v6, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    :goto_1
    move v0, v5

    .line 164
    if-eqz v0, :cond_3

    .line 165
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v4, v5, :cond_3

    .line 166
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, ".mnc"

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 167
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, ".mcc"

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 168
    const-string v4, "apnMatcher: apns are equal but format unexpected"

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/4 v0, 0x0

    .line 172
    :cond_3
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-eq v4, v6, :cond_4

    .line 173
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "."

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 174
    const-string v4, "apnMatcher: apn are equal as apn.xxx type"

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    const/4 v0, 0x1

    .line 178
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "apnMatcher: match: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    return v0
.end method

.method private getApnType(Ljava/lang/String;Ljava/util/ArrayList;)[Ljava/lang/String;
    .locals 4
    .param p1, "apnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/data/ApnSetting;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 132
    .local p2, "settings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/telephony/data/ApnSetting;>;"
    if-eqz p2, :cond_1

    .line 133
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 134
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/data/ApnSetting;

    .line 136
    .local v1, "apn":Landroid/telephony/data/ApnSetting;
    invoke-virtual {v1}, Landroid/telephony/data/ApnSetting;->getApnName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->apnMatcher(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 137
    nop

    .line 138
    invoke-virtual {v1}, Landroid/telephony/data/ApnSetting;->getApnTypeBitmask()I

    move-result v2

    .line 137
    invoke-static {v2}, Landroid/telephony/data/ApnSetting;->getApnTypesStringFromBitmask(I)Ljava/lang/String;

    move-result-object v2

    .line 138
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 137
    return-object v2

    .line 133
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    .end local v0    # "i":I
    .end local v1    # "apn":Landroid/telephony/data/ApnSetting;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private sendPcoIdAndContentOnly(Lcom/android/internal/telephony/Phone;Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;)V
    .locals 4
    .param p1, "phone"    # Lcom/android/internal/telephony/Phone;
    .param p2, "pcoData"    # Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;

    .line 121
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 122
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "apnType"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 123
    const-string v1, "apnTypeInt"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 124
    const-string v1, "apnProto"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 125
    iget v1, p2, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->pcoId:I

    const-string v2, "pcoId"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 126
    iget-object v1, p2, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->contents:[B

    const-string v2, "pcoValue"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 127
    invoke-virtual {p1}, Lcom/android/internal/telephony/Phone;->getCarrierSignalAgent()Lcom/android/internal/telephony/CarrierSignalAgent;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/CarrierSignalAgent;->notifyCarrierSignalReceivers(Landroid/content/Intent;)V

    .line 128
    return-void
.end method


# virtual methods
.method public getIsPcoAllowedDefault()Z
    .locals 1

    .line 189
    iget-boolean v0, p0, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->mIsPcoAllowedDefault:Z

    return v0
.end method

.method public getPcoActionByApnType(Lcom/android/internal/telephony/dataconnection/ApnContext;Landroid/telephony/PcoData;)I
    .locals 6
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;
    .param p2, "pcoData"    # Landroid/telephony/PcoData;

    .line 205
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "apnType":Ljava/lang/String;
    const-string v1, "default"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 207
    iget-object v1, p2, Landroid/telephony/PcoData;->contents:[B

    aget-byte v1, v1, v2

    const/16 v3, 0x33

    const-string v4, "Op12DataConnectionExt"

    const/4 v5, 0x1

    if-ne v1, v3, :cond_0

    .line 211
    const-string v1, "persist.vendor.pco3.teardown.internet"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v5, :cond_1

    .line 212
    const-string v1, "getPcoActionByApnType PCO:3 disable and teardown default PDN"

    invoke-static {v4, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-virtual {p0, v2}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->setIsPcoAllowedDefault(Z)V

    .line 214
    return v5

    .line 216
    :cond_0
    iget-object v1, p2, Landroid/telephony/PcoData;->contents:[B

    aget-byte v1, v1, v2

    const/16 v3, 0x30

    if-ne v1, v3, :cond_1

    .line 217
    const-string v1, "getPcoActionByApnType PCO:0 setIsPcoAllowedDefault true"

    invoke-static {v4, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    invoke-virtual {p0, v5}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->setIsPcoAllowedDefault(Z)V

    .line 221
    :cond_1
    return v2
.end method

.method public handlePcoDataAfterAttached(Landroid/os/AsyncResult;Lcom/android/internal/telephony/Phone;Ljava/util/ArrayList;)V
    .locals 9
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "phone"    # Lcom/android/internal/telephony/Phone;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/AsyncResult;",
            "Lcom/android/internal/telephony/Phone;",
            "Ljava/util/ArrayList<",
            "Landroid/telephony/data/ApnSetting;",
            ">;)V"
        }
    .end annotation

    .line 71
    .local p3, "settings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/telephony/data/ApnSetting;>;"
    const-string v0, "Op12DataConnectionExt"

    if-nez p1, :cond_0

    .line 72
    const-string v1, "handlePcoDataAfterAttached ar is null"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    return-void

    .line 74
    :cond_0
    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handlePcoDataAfterAttached PCO_DATA exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    return-void

    .line 77
    :cond_1
    if-nez p2, :cond_2

    .line 78
    const-string v1, "handlePcoDataAfterAttached phone is null"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    return-void

    .line 82
    :cond_2
    iget-object v1, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;

    .line 83
    .local v1, "pcoData":Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;
    if-nez v1, :cond_3

    .line 84
    const-string v2, "handlePcoDataAfterAttached pco status is null"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void

    .line 88
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handlePcoDataAfterAttached "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handlePcoDataAfterAttached pcoData.contents first byte: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->contents:[B

    const/4 v4, 0x0

    aget-byte v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v2, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->apnName:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->apnName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    .line 98
    :cond_4
    iget-object v2, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->apnName:Ljava/lang/String;

    invoke-direct {p0, v2, p3}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->getApnType(Ljava/lang/String;Ljava/util/ArrayList;)[Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "aryApnType":[Ljava/lang/String;
    if-nez v2, :cond_5

    .line 100
    const-string v3, "handlePcoDataAfterAttached getApnType() return null, send value only"

    invoke-static {v0, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    invoke-direct {p0, p2, v1}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->sendPcoIdAndContentOnly(Lcom/android/internal/telephony/Phone;Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;)V

    .line 102
    return-void

    .line 105
    :cond_5
    array-length v3, v2

    :goto_0
    if-ge v4, v3, :cond_6

    aget-object v5, v2, v4

    .line 106
    .local v5, "apnType":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handlePcoDataAfterAttached send intent for apn type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    new-instance v6, Landroid/content/Intent;

    const-string v7, "com.android.internal.telephony.CARRIER_SIGNAL_PCO_VALUE"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 108
    .local v6, "intent":Landroid/content/Intent;
    const-string v7, "apnType"

    invoke-virtual {v6, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 109
    nop

    .line 110
    invoke-static {v5}, Landroid/telephony/data/ApnSetting;->getApnTypesBitmaskFromString(Ljava/lang/String;)I

    move-result v7

    .line 109
    const-string v8, "apnTypeInt"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 111
    iget-object v7, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->bearerProto:Ljava/lang/String;

    const-string v8, "apnProto"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 112
    iget-object v7, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->bearerProto:Ljava/lang/String;

    .line 113
    invoke-static {v7}, Landroid/telephony/data/ApnSetting;->getProtocolIntFromString(Ljava/lang/String;)I

    move-result v7

    .line 112
    const-string v8, "apnProtoInt"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 114
    iget v7, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->pcoId:I

    const-string v8, "pcoId"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 115
    iget-object v7, v1, Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;->contents:[B

    const-string v8, "pcoValue"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 116
    invoke-virtual {p2}, Lcom/android/internal/telephony/Phone;->getCarrierSignalAgent()Lcom/android/internal/telephony/CarrierSignalAgent;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/android/internal/telephony/CarrierSignalAgent;->notifyCarrierSignalReceivers(Landroid/content/Intent;)V

    .line 105
    .end local v5    # "apnType":Ljava/lang/String;
    .end local v6    # "intent":Landroid/content/Intent;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 118
    :cond_6
    return-void

    .line 93
    .end local v2    # "aryApnType":[Ljava/lang/String;
    :cond_7
    :goto_1
    const-string v2, "handlePcoDataAfterAttached apn name null, send value only"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-direct {p0, p2, v1}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->sendPcoIdAndContentOnly(Lcom/android/internal/telephony/Phone;Lcom/mediatek/internal/telephony/dataconnection/PcoDataAfterAttached;)V

    .line 95
    return-void
.end method

.method public setIsPcoAllowedDefault(Z)V
    .locals 0
    .param p1, "allowed"    # Z

    .line 197
    iput-boolean p1, p0, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;->mIsPcoAllowedDefault:Z

    .line 198
    return-void
.end method

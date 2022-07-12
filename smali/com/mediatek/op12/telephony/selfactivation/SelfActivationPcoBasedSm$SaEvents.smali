.class Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm$SaEvents;
.super Ljava/lang/Object;
.source "SelfActivationPcoBasedSm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SaEvents"
.end annotation


# static fields
.field static final EVENT_CALL_STATE_IDLE:I = 0x8

.field static final EVENT_CALL_STATE_START:I = 0x7

.field static final EVENT_DBG_RESET:I = 0x68

.field static final EVENT_DISABLE_RADIO_PCO:I = 0x65

.field static final EVENT_EXTERNAL_START:I = 0x0

.field static final EVENT_INTERNAL_START:I = 0x64

.field static final EVENT_NETWORK_REJECT:I = 0xa

.field static final EVENT_PCO_STATE:I = 0x5

.field static final EVENT_RM_RADIO_AVAILABLE:I = 0x3

.field static final EVENT_RM_RADIO_CHANGED:I = 0x0

.field static final EVENT_RM_RADIO_OFF:I = 0x1

.field static final EVENT_RM_RADIO_ON:I = 0x2

.field static final EVENT_SELF_ACT:I = 0x4

.field static final EVENT_SIM_STATE_CHANGED:I = 0x9

.field static final EVENT_SYNC_RADIO_CTRL_DONE:I = 0x67

.field static final EVENT_TIMER_RADIO_OFF:I = 0x66


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static print(I)Ljava/lang/String;
    .locals 4
    .param p0, "eventCode"    # I

    .line 1189
    const-string v0, ""

    .line 1190
    .local v0, "outString":Ljava/lang/String;
    if-eqz p0, :cond_5

    const/4 v1, 0x1

    if-eq p0, v1, :cond_4

    const/4 v1, 0x2

    if-eq p0, v1, :cond_3

    const/4 v1, 0x3

    if-eq p0, v1, :cond_2

    const/4 v1, 0x4

    if-eq p0, v1, :cond_1

    const/4 v1, 0x5

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    .line 1206
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid eventCode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1203
    :pswitch_0
    const-string v0, "EVENT_DBG_RESET"

    goto :goto_0

    .line 1202
    :pswitch_1
    const-string v0, "EVENT_SYNC_RADIO_CTRL_DONE"

    goto :goto_0

    .line 1201
    :pswitch_2
    const-string v0, "EVENT_TIMER_RADIO_OFF"

    goto :goto_0

    .line 1200
    :pswitch_3
    const-string v0, "EVENT_DISABLE_RADIO_PCO"

    goto :goto_0

    .line 1204
    :pswitch_4
    const-string v0, "EVENT_NETWORK_REJECT"

    goto :goto_0

    .line 1199
    :pswitch_5
    const-string v0, "EVENT_SIM_STATE_CHANGED"

    goto :goto_0

    .line 1198
    :pswitch_6
    const-string v0, "EVENT_CALL_STATE_IDLE"

    goto :goto_0

    .line 1197
    :pswitch_7
    const-string v0, "EVENT_CALL_STATE_START"

    goto :goto_0

    .line 1196
    :cond_0
    const-string v0, "EVENT_PCO_STATE"

    goto :goto_0

    .line 1195
    :cond_1
    const-string v0, "EVENT_SELF_ACT"

    goto :goto_0

    .line 1194
    :cond_2
    const-string v0, "EVENT_RM_RADIO_AVAILABLE"

    goto :goto_0

    .line 1193
    :cond_3
    const-string v0, "EVENT_RM_RADIO_ON"

    goto :goto_0

    .line 1192
    :cond_4
    const-string v0, "EVENT_RM_RADIO_OFF"

    goto :goto_0

    .line 1191
    :cond_5
    const-string v0, "EVENT_RM_RADIO_CHANGED"

    .line 1208
    :goto_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x65
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

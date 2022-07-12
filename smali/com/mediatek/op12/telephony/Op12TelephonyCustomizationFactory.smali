.class public Lcom/mediatek/op12/telephony/Op12TelephonyCustomizationFactory;
.super Lcom/mediatek/internal/telephony/OpTelephonyCustomizationFactoryBase;
.source "Op12TelephonyCustomizationFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/OpTelephonyCustomizationFactoryBase;-><init>()V

    return-void
.end method


# virtual methods
.method public makeDataConnectionExt(Landroid/content/Context;)Lcom/mediatek/internal/telephony/dataconnection/IDataConnectionExt;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 53
    new-instance v0, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;

    invoke-direct {v0, p1}, Lcom/mediatek/op12/telephony/Op12DataConnectionExt;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public makeRsuSml(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/mediatek/internal/telephony/uicc/IMtkRsuSml;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .line 74
    new-instance v0, Lcom/mediatek/op12/telephony/Op12RsuSml12;

    invoke-direct {v0, p1, p2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;-><init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V

    return-object v0
.end method

.method public makeSCBMManager(Landroid/content/Context;ILcom/android/internal/telephony/CommandsInterface;)Lcom/mediatek/internal/telephony/scbm/ISCBMManager;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "phoneId"    # I
    .param p3, "ci"    # Lcom/android/internal/telephony/CommandsInterface;

    .line 69
    new-instance v0, Lcom/mediatek/op12/telephony/Op12SCBMManager;

    invoke-direct {v0, p1, p2, p3}, Lcom/mediatek/op12/telephony/Op12SCBMManager;-><init>(Landroid/content/Context;ILcom/android/internal/telephony/CommandsInterface;)V

    return-object v0
.end method

.method public makeSelfActivationInstance(I)Lcom/mediatek/internal/telephony/selfactivation/ISelfActivation;
    .locals 2
    .param p1, "phoneId"    # I

    .line 63
    const/4 v0, 0x0

    .line 64
    .local v0, "instance":Lcom/mediatek/internal/telephony/selfactivation/ISelfActivation;
    new-instance v1, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;

    invoke-direct {v1, p1}, Lcom/mediatek/op12/telephony/selfactivation/SelfActivationPcoBasedSm;-><init>(I)V

    move-object v0, v1

    .line 65
    return-object v0
.end method

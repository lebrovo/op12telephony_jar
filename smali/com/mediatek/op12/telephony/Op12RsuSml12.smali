.class public Lcom/mediatek/op12/telephony/Op12RsuSml12;
.super Lcom/mediatek/internal/telephony/uicc/IMtkRsuSml;
.source "Op12RsuSml12.java"


# static fields
.field private static final BASE:I = 0x0

.field private static final DUMMY_TOKEN:I = -0x1

.field private static final OPERATOR_VERIZON:I = 0x1

.field private static final PACKAGENAME_SHA256SIG_PAIR:[[Ljava/lang/String;

.field private static final REMOTE_SIM_UNLOCK_ERROR:I = 0x1

.field private static final REMOTE_SIM_UNLOCK_SUCCESS:I = 0x0

.field private static final RSU_MESSAGE_GET_LOCK_STATUS:I = 0x5

.field private static final RSU_MESSAGE_GET_LOCK_VERSION:I = 0x3

.field private static final RSU_MESSAGE_INIT_REQUEST:I = 0x1

.field private static final RSU_MESSAGE_RESET_LOCK_DATA:I = 0x4

.field private static final RSU_MESSAGE_UNLOCK_TIMER:I = 0x6

.field private static final RSU_MESSAGE_UNSOL_RSU_EVENT:I = 0x7

.field private static final RSU_MESSAGE_UPDATE_LOCK_DATA:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Op12RsuSml12"

.field private static final USELESS_INT_VALUE:I = 0x0

.field private static final USELESS_STRING_VALUE:Ljava/lang/String; = ""


# instance fields
.field public mCb:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

.field private mContext:Landroid/content/Context;

.field private mRequestHandler:Landroid/os/Handler;

.field private mUrcHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 103
    const/4 v0, 0x1

    new-array v0, v0, [[Ljava/lang/String;

    const-string v1, "com.verizon.mips.services"

    const-string v2, "ff82050bf6bed1f152ac1a12dc83cacbad401775161882872c6665fc5e15c8f2"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->PACKAGENAME_SHA256SIG_PAIR:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .line 114
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSml;-><init>()V

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    .line 402
    new-instance v0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;

    invoke-direct {v0, p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;-><init>(Lcom/mediatek/op12/telephony/Op12RsuSml12;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 535
    new-instance v0, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;

    invoke-direct {v0, p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;-><init>(Lcom/mediatek/op12/telephony/Op12RsuSml12;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mUrcHandler:Landroid/os/Handler;

    .line 115
    const-string v0, "initialize Op12RsuSml12"

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V

    .line 117
    iput-object p1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    .line 118
    array-length v0, p2

    new-array v0, v0, [Lcom/mediatek/opcommon/telephony/MtkRilOp;

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    .line 119
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v2, p2, v0

    check-cast v2, Lcom/mediatek/internal/telephony/MtkRIL;

    invoke-virtual {v2}, Lcom/mediatek/internal/telephony/MtkRIL;->getRilOp()Lcom/mediatek/internal/telephony/IMtkRilOp;

    move-result-object v2

    check-cast v2, Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aput-object v2, v1, v0

    .line 119
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 123
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mUrcHandler:Landroid/os/Handler;

    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->registerForRsuEvent(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 124
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/Op12RsuSml12;
    .param p1, "x1"    # Ljava/lang/String;

    .line 76
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/Op12RsuSml12;
    .param p1, "x1"    # Ljava/lang/String;

    .line 76
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->hexs2Bytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/op12/telephony/Op12RsuSml12;
    .param p1, "x1"    # Ljava/lang/String;

    .line 76
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V

    return-void
.end method

.method private bytes2Hexs([B)Ljava/lang/String;
    .locals 1
    .param p1, "bytes"    # [B

    .line 564
    invoke-static {p1}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;
    .locals 1
    .param p1, "opId"    # I
    .param p2, "requestId"    # I
    .param p3, "requestType"    # I
    .param p4, "data"    # Ljava/lang/String;

    .line 555
    new-instance v0, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    invoke-direct {v0}, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;-><init>()V

    .line 556
    .local v0, "rri":Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;
    iput p1, v0, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;->opId:I

    .line 557
    iput p2, v0, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;->requestId:I

    .line 558
    iput p3, v0, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;->requestType:I

    .line 559
    iput-object p4, v0, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;->data:Ljava/lang/String;

    .line 560
    return-object v0
.end method

.method private enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z
    .locals 6
    .param p1, "signature"    # [Landroid/content/pm/Signature;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "msg"    # Landroid/os/Message;

    .line 622
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    const-string v1, "com.verizon.permission.ACCESS_REMOTE_SIMLOCK"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 623
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 624
    array-length v1, p1

    move v2, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 625
    .local v3, "s":Landroid/content/pm/Signature;
    const-string v4, "SHA-256"

    invoke-direct {p0, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCertHash(Landroid/content/pm/Signature;Ljava/lang/String;)[B

    move-result-object v4

    .line 626
    .local v4, "certHash256":[B
    invoke-direct {p0, v4, p2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->matches([BLjava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 627
    const/4 v0, 0x1

    return v0

    .line 624
    .end local v3    # "s":Landroid/content/pm/Signature;
    .end local v4    # "certHash256":[B
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 631
    :cond_1
    return v0
.end method

.method private getCallerPackageName()Ljava/lang/String;
    .locals 8

    .line 576
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v0

    .line 577
    .local v0, "callerPid":I
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    .line 578
    .local v1, "callerUid":I
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getNameForUid(I)Ljava/lang/String;

    move-result-object v2

    .line 579
    .local v2, "packageName":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 580
    iget-object v3, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    const-string v4, "activity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 582
    .local v3, "activityManager":Landroid/app/ActivityManager;
    if-eqz v3, :cond_1

    .line 583
    nop

    .line 584
    invoke-virtual {v3}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    .line 585
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 586
    .local v6, "info":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v7, v6, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v7, v0, :cond_0

    .line 587
    iget-object v2, v6, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 588
    goto :goto_1

    .line 590
    .end local v6    # "info":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_0
    goto :goto_0

    .line 593
    .end local v3    # "activityManager":Landroid/app/ActivityManager;
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_1
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCallerPackageName callerPid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "callerUid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " processName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 595
    return-object v2
.end method

.method private getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;

    .line 599
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 603
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 606
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/16 v2, 0x40

    :try_start_0
    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 607
    .local v2, "pi":Landroid/content/pm/PackageInfo;
    if-nez v2, :cond_1

    .line 608
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCallerSignature fail, package information is null for packageName "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 610
    return-object v0

    .line 615
    :cond_1
    nop

    .line 616
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCallerSignature packageName "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", signatures "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 617
    iget-object v0, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    return-object v0

    .line 612
    .end local v2    # "pi":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v2

    .line 613
    .local v2, "localNameNotFoundException":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCallerSignature fail, has no packageName "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 614
    return-object v0

    .line 600
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    .end local v2    # "localNameNotFoundException":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_2
    :goto_0
    const-string v1, "getCallerSignature fail, packageName is null"

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 601
    return-object v0
.end method

.method private getCertHash(Landroid/content/pm/Signature;Ljava/lang/String;)[B
    .locals 3
    .param p1, "signature"    # Landroid/content/pm/Signature;
    .param p2, "algo"    # Ljava/lang/String;

    .line 641
    :try_start_0
    invoke-static {p2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 642
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {p1}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 643
    .end local v0    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 644
    .local v0, "ex":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getCertHash NoSuchAlgorithmException "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 646
    .end local v0    # "ex":Ljava/security/NoSuchAlgorithmException;
    const/4 v0, 0x0

    return-object v0
.end method

.method private hexs2Bytes(Ljava/lang/String;)[B
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .line 568
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    goto :goto_0

    .line 572
    :cond_0
    invoke-static {p1}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    .line 569
    :cond_1
    :goto_0
    const-string v0, "The length of hex string is not even numbers"

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V

    .line 570
    const/4 v0, 0x0

    return-object v0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 677
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[RSU-SIMLOCK] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12RsuSml12"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 673
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[RSU-SIMLOCK] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12RsuSml12"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 674
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 681
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[RSU-SIMLOCK] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12RsuSml12"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 682
    return-void
.end method

.method private matches([BLjava/lang/String;)Z
    .locals 7
    .param p1, "certHash"    # [B
    .param p2, "packageName"    # Ljava/lang/String;

    .line 650
    sget-object v0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->PACKAGENAME_SHA256SIG_PAIR:[[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 651
    .local v4, "pkgSsigP":[Ljava/lang/String;
    if-eqz p1, :cond_0

    const/4 v5, 0x1

    aget-object v6, v4, v5

    invoke-direct {p0, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->hexs2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-static {v6, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 652
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    aget-object v6, v4, v2

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 653
    const-string v0, "matches return true"

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 654
    return v5

    .line 650
    .end local v4    # "pkgSsigP":[Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 657
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "matches packageName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " certHashHex = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->bytes2Hexs([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hasSystemFeature() = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mContext:Landroid/content/Context;

    .line 658
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v3, "com.verizon.feature.networklock"

    invoke-virtual {v1, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 657
    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 660
    return v2
.end method

.method private sendErrorToCallback(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .line 664
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/android/internal/telephony/CommandException;->fromRilErrno(I)Lcom/android/internal/telephony/CommandException;

    move-result-object v0

    .line 665
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    new-instance v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;

    invoke-direct {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;-><init>()V

    .line 666
    .local v1, "ret":Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;
    if-eqz p1, :cond_0

    .line 667
    invoke-static {p1, v1, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 668
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 670
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized deregisterCallback(Ljava/lang/Object;)I
    .locals 4
    .param p1, "cb"    # Ljava/lang/Object;

    monitor-enter p0

    .line 177
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deregisterCallback IMtkRsuSmlCallback = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V

    .line 178
    const/4 v0, 0x0

    .line 179
    .local v0, "isPass":Z
    nop

    .line 180
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 181
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 179
    invoke-direct {p0, v1, v2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v1

    move v0, v1

    .line 183
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 184
    const-string v2, "deregisterCallback, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    monitor-exit p0

    return v1

    .line 187
    .end local p0    # "this":Lcom/mediatek/op12/telephony/Op12RsuSml12;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    move-object v3, p1

    check-cast v3, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 188
    :cond_1
    nop

    .line 187
    :goto_0
    monitor-exit p0

    return v1

    .line 176
    .end local v0    # "isPass":Z
    .end local p1    # "cb":Ljava/lang/Object;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized registerCallback(Ljava/lang/Object;)I
    .locals 5
    .param p1, "cb"    # Ljava/lang/Object;

    monitor-enter p0

    .line 137
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "registerCallback IMtkRsuSmlCallback = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V

    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "isPass":Z
    nop

    .line 140
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 141
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 139
    invoke-direct {p0, v1, v2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v1

    move v0, v1

    .line 143
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 144
    const-string v2, "registerCallback, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    monitor-exit p0

    return v1

    .line 148
    .end local p0    # "this":Lcom/mediatek/op12/telephony/Op12RsuSml12;
    :cond_0
    if-eqz p1, :cond_3

    :try_start_1
    instance-of v2, p1, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    if-eqz v2, :cond_3

    .line 149
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    move-object v3, p1

    check-cast v3, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 150
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 151
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 152
    .local v2, "icb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected, New register incoming, will remove un-deregistered callback icb = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 154
    .end local v2    # "icb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    goto :goto_0

    .line 155
    :cond_1
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 157
    :cond_2
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "registerCallback callback size = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    const/4 v1, 0x0

    monitor-exit p0

    return v1

    .line 162
    :cond_3
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "registerCallback fail IMtkRsuSmlCallback = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logi(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 163
    monitor-exit p0

    return v1

    .line 136
    .end local v0    # "isPass":Z
    .end local p1    # "cb":Ljava/lang/Object;
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public remoteSimlockGenerateRequest(II)I
    .locals 6
    .param p1, "token"    # I
    .param p2, "requestType"    # I

    .line 312
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockGenerateRequest token = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " requestType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 314
    const/4 v0, 0x0

    .line 315
    .local v0, "isPass":Z
    nop

    .line 316
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 317
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 318
    const/4 v5, 0x1

    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 315
    invoke-direct {p0, v1, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v0

    .line 319
    if-nez v0, :cond_0

    .line 320
    const-string v1, "remoteSimlockGenerateRequest, permission denied"

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 321
    return v5

    .line 323
    :cond_0
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v3, v1, v2

    if-eqz v3, :cond_1

    .line 324
    aget-object v1, v1, v2

    const-string v3, ""

    invoke-direct {p0, v5, v2, p2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 328
    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 324
    invoke-virtual {v1, v3, v4}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 329
    return v2

    .line 332
    :cond_1
    return v5
.end method

.method public remoteSimlockGetSimlockStatus(I)I
    .locals 6
    .param p1, "token"    # I

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockGetSimlockStatus token = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 275
    const/4 v0, 0x0

    .line 276
    .local v0, "isPass":Z
    nop

    .line 277
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 278
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 279
    const/4 v5, 0x5

    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 276
    invoke-direct {p0, v1, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v0

    .line 280
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 281
    const-string v2, "remoteSimlockGetSimlockStatus, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 282
    return v1

    .line 284
    :cond_0
    iget-object v3, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v4, v3, v2

    if-eqz v4, :cond_1

    .line 285
    aget-object v3, v3, v2

    const-string v4, ""

    invoke-direct {p0, v1, v5, v2, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 289
    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 285
    invoke-virtual {v3, v1, v4}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 290
    return v2

    .line 293
    :cond_1
    return v1
.end method

.method public remoteSimlockGetSimlockStatusEx(Ljava/lang/Object;)I
    .locals 6
    .param p1, "cb"    # Ljava/lang/Object;

    .line 388
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockGetSimlockStatusEx mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 389
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v1, v0, v2

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    .line 390
    aget-object v0, v0, v2

    const/4 v1, 0x5

    const-string v4, ""

    invoke-direct {p0, v3, v1, v2, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    const/4 v5, -0x1

    .line 394
    invoke-virtual {v4, v1, v2, v5, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 390
    invoke-virtual {v0, v3, v1}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 396
    return v2

    .line 399
    :cond_0
    return v3
.end method

.method public remoteSimlockGetVersion(I)I
    .locals 6
    .param p1, "token"    # I

    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockGetVersion token = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 242
    const/4 v0, 0x0

    .line 243
    .local v0, "isPass":Z
    nop

    .line 244
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 245
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 246
    const/4 v5, 0x3

    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 243
    invoke-direct {p0, v1, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v0

    .line 247
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 248
    const-string v2, "remoteSimlockGetVersion, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 249
    return v1

    .line 251
    :cond_0
    iget-object v3, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v4, v3, v2

    if-eqz v4, :cond_1

    .line 252
    aget-object v3, v3, v2

    const-string v4, ""

    invoke-direct {p0, v1, v5, v2, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 256
    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 252
    invoke-virtual {v3, v1, v4}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 257
    return v2

    .line 260
    :cond_1
    return v1
.end method

.method public remoteSimlockProcessSimlockData(I[B)I
    .locals 6
    .param p1, "token"    # I
    .param p2, "data"    # [B

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockProcessSimlockData data = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->bytes2Hexs([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " token = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 208
    const/4 v0, 0x0

    .line 209
    .local v0, "isPass":Z
    nop

    .line 210
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 211
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 212
    const/4 v5, 0x2

    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 209
    invoke-direct {p0, v1, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v0

    .line 213
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 214
    const-string v2, "remoteSimlockProcessSimlockData, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 215
    return v1

    .line 217
    :cond_0
    iget-object v3, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v4, v3, v2

    if-eqz v4, :cond_1

    .line 218
    aget-object v3, v3, v2

    .line 221
    invoke-direct {p0, p2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->bytes2Hexs([B)Ljava/lang/String;

    move-result-object v4

    .line 218
    invoke-direct {p0, v1, v5, v2, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 222
    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 218
    invoke-virtual {v3, v1, v4}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 223
    return v2

    .line 226
    :cond_1
    return v1
.end method

.method public remoteSimlockUnlockTimer(II)I
    .locals 7
    .param p1, "token"    # I
    .param p2, "requestType"    # I

    .line 353
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remoteSimlockUnlockTimer token = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " requestType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mCi[0] = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->logd(Ljava/lang/String;)V

    .line 355
    const/4 v0, 0x0

    .line 356
    .local v0, "isPass":Z
    nop

    .line 357
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerSignature(Ljava/lang/String;)[Landroid/content/pm/Signature;

    move-result-object v1

    .line 358
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->getCallerPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 359
    const/4 v5, 0x6

    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 356
    invoke-direct {p0, v1, v3, v4}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->enforcePermissionCheck([Landroid/content/pm/Signature;Ljava/lang/String;Landroid/os/Message;)Z

    move-result v0

    .line 360
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 361
    const-string v2, "remoteSimlockUnlockTimer, permission denied"

    invoke-direct {p0, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->loge(Ljava/lang/String;)V

    .line 362
    return v1

    .line 364
    :cond_0
    iget-object v3, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCi:[Lcom/mediatek/opcommon/telephony/MtkRilOp;

    aget-object v4, v3, v2

    if-eqz v4, :cond_1

    .line 365
    aget-object v3, v3, v2

    const/16 v4, 0x32

    const-string v6, ""

    invoke-direct {p0, v1, v4, p2, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->constructRsuRequestInfoRilRequest(IIILjava/lang/String;)Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    move-result-object v1

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mRequestHandler:Landroid/os/Handler;

    .line 369
    invoke-virtual {v4, v5, v2, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v4

    .line 365
    invoke-virtual {v3, v1, v4}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->sendRsuRequest(Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;Landroid/os/Message;)V

    .line 370
    return v2

    .line 373
    :cond_1
    return v1
.end method

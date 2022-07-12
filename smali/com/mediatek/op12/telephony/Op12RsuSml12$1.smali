.class Lcom/mediatek/op12/telephony/Op12RsuSml12$1;
.super Landroid/os/Handler;
.source "Op12RsuSml12.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/Op12RsuSml12;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;


# direct methods
.method constructor <init>(Lcom/mediatek/op12/telephony/Op12RsuSml12;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/Op12RsuSml12;

    .line 402
    iput-object p1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 14
    .param p1, "msg"    # Landroid/os/Message;

    .line 405
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 406
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;

    .line 407
    .local v1, "rri":Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;
    iget v9, p1, Landroid/os/Message;->arg2:I

    .line 409
    .local v9, "token":I
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "callback size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v4, v4, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " exception = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " errCode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    if-eqz v1, :cond_0

    iget v4, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->errCode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_0

    :cond_0
    const-string v4, "NULL"

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " token = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " what = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 409
    invoke-static {v2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 416
    iget-object v10, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    monitor-enter v10

    .line 417
    :try_start_0
    iget v2, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v5, :cond_16

    const/4 v6, 0x2

    if-eq v2, v6, :cond_11

    const/4 v6, 0x3

    const/4 v7, -0x1

    if-eq v2, v6, :cond_b

    const/4 v3, 0x5

    if-eq v2, v3, :cond_5

    const/4 v3, 0x6

    if-eq v2, v3, :cond_1

    .line 528
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    const-string v3, "Unknown request or request that need not handle"

    invoke-static {v2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$200(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    goto/16 :goto_11

    .line 508
    :cond_1
    const/4 v2, 0x0

    .line 509
    .local v2, "errCode":I
    const/4 v3, 0x0

    .line 510
    .local v3, "time1":I
    if-nez v1, :cond_2

    .line 511
    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    const-string v6, "RSU_MESSAGE_UNLOCK_TIMER, rri == null"

    invoke-static {v4, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    goto :goto_1

    .line 513
    :cond_2
    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "timerStatus = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->errCode:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", passedTime = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->time:J

    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 514
    iget v4, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->errCode:I

    move v2, v4

    .line 515
    iget-wide v11, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->time:J

    long-to-int v3, v11

    .line 517
    :goto_1
    iget-object v4, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v4, v4, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 518
    .local v6, "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v8, :cond_3

    .line 519
    invoke-virtual {v6, v9, v5, v7}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockUnlockTimerResponse(III)V

    goto :goto_3

    .line 522
    :cond_3
    invoke-virtual {v6, v9, v2, v3}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockUnlockTimerResponse(III)V

    .line 525
    .end local v6    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    :goto_3
    goto :goto_2

    .line 526
    :cond_4
    goto/16 :goto_11

    .line 459
    .end local v2    # "errCode":I
    .end local v3    # "time1":I
    :cond_5
    const/4 v2, 0x0

    .line 460
    .local v2, "status":I
    const/4 v3, 0x0

    .line 461
    .local v3, "time":I
    if-nez v1, :cond_6

    .line 462
    iget-object v5, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    const-string v6, "RSU_MESSAGE_GET_LOCK_STATUS, rri == null"

    invoke-static {v5, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    move v11, v2

    move v12, v3

    goto :goto_4

    .line 464
    :cond_6
    iget-object v5, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unlockStatus = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->status:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ", unlockTime = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v11, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->time:J

    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 465
    iget v5, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->status:I

    move v2, v5

    .line 466
    iget-wide v5, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->time:J

    long-to-int v3, v5

    move v11, v2

    move v12, v3

    .line 468
    .end local v2    # "status":I
    .end local v3    # "time":I
    .local v11, "status":I
    .local v12, "time":I
    :goto_4
    if-ne v9, v7, :cond_8

    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    if-eqz v2, :cond_8

    .line 470
    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Landroid/os/Message;

    .line 471
    .local v2, "cb":Landroid/os/Message;
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_7

    .line 472
    invoke-static {v2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;)Landroid/os/AsyncResult;

    move-result-object v3

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    iput-object v4, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    goto :goto_5

    .line 474
    :cond_7
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3, v4}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 476
    :goto_5
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 477
    goto/16 :goto_11

    .line 479
    .end local v2    # "cb":Landroid/os/Message;
    :cond_8
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v2, v2, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 481
    .local v2, "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_9

    .line 482
    const/4 v4, 0x1

    const/4 v5, -0x1

    const-wide/16 v6, -0x1

    move v3, v9

    invoke-virtual/range {v2 .. v7}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGetSimlockStatusResponse(IIIJ)V

    goto :goto_7

    .line 485
    :cond_9
    const/4 v5, 0x0

    int-to-long v7, v12

    move-object v3, v2

    move v4, v9

    move v6, v11

    invoke-virtual/range {v3 .. v8}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGetSimlockStatusResponse(IIIJ)V

    .line 488
    .end local v2    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    :goto_7
    goto :goto_6

    .line 489
    :cond_a
    goto/16 :goto_11

    .line 436
    .end local v11    # "status":I
    .end local v12    # "time":I
    :cond_b
    const/4 v2, -0x1

    .line 437
    .local v2, "version":I
    const/4 v4, -0x1

    .line 438
    .local v4, "majorVersion":I
    const/4 v6, -0x1

    .line 439
    .local v6, "minorVersion":I
    if-eqz v1, :cond_c

    .line 440
    iget v8, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->version:I

    move v2, v8

    .line 442
    :cond_c
    if-ltz v2, :cond_d

    .line 443
    shr-int/lit8 v8, v2, 0x10

    const v11, 0xffff

    and-int v4, v8, v11

    .line 444
    and-int v6, v2, v11

    .line 446
    :cond_d
    iget-object v8, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "majorVersion = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", minorVersion = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v11}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 448
    iget-object v8, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v8, v8, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_10

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 449
    .local v11, "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    iget-object v12, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v12, :cond_f

    if-eq v4, v7, :cond_f

    if-ne v6, v7, :cond_e

    goto :goto_9

    .line 453
    :cond_e
    invoke-virtual {v11, v9, v3, v4, v6}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGetVersionResponse(IIII)V

    goto :goto_a

    .line 450
    :cond_f
    :goto_9
    invoke-virtual {v11, v9, v5, v7, v7}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGetVersionResponse(IIII)V

    .line 456
    .end local v11    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    :goto_a
    goto :goto_8

    .line 457
    :cond_10
    goto/16 :goto_11

    .line 419
    .end local v2    # "version":I
    .end local v4    # "majorVersion":I
    .end local v6    # "minorVersion":I
    :cond_11
    const/4 v2, 0x0

    .line 420
    .local v2, "lockData":[B
    if-eqz v1, :cond_12

    iget-object v6, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->data:Ljava/lang/String;

    if-eqz v6, :cond_12

    .line 421
    iget-object v6, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v7, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->data:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$100(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)[B

    move-result-object v6

    move-object v2, v6

    .line 423
    :cond_12
    iget-object v6, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v6, v6, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_15

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 424
    .local v7, "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    iget-object v8, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "callback cb = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v11}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 425
    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v8, :cond_14

    if-eqz v2, :cond_14

    array-length v8, v2

    if-nez v8, :cond_13

    goto :goto_c

    .line 430
    :cond_13
    invoke-virtual {v7, v9, v3, v2}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockProcessSimlockDataResponse(II[B)V

    goto :goto_d

    .line 427
    :cond_14
    :goto_c
    invoke-virtual {v7, v9, v5, v4}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockProcessSimlockDataResponse(II[B)V

    .line 433
    .end local v7    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    :goto_d
    goto :goto_b

    .line 434
    :cond_15
    goto :goto_11

    .line 491
    .end local v2    # "lockData":[B
    :cond_16
    const/4 v2, 0x0

    .line 492
    .local v2, "initRequest":[B
    if-eqz v1, :cond_17

    iget-object v6, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->data:Ljava/lang/String;

    if-eqz v6, :cond_17

    .line 493
    iget-object v6, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RSU_MESSAGE_INIT_REQUEST rri.data = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->data:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$200(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 494
    iget-object v6, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v7, v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuResponseInfo;->data:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$100(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)[B

    move-result-object v6

    move-object v2, v6

    .line 496
    :cond_17
    iget-object v6, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$1;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    iget-object v6, v6, Lcom/mediatek/op12/telephony/Op12RsuSml12;->mCb:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;

    .line 497
    .restart local v7    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    iget-object v8, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v8, :cond_19

    if-eqz v2, :cond_19

    array-length v8, v2

    if-nez v8, :cond_18

    goto :goto_f

    .line 502
    :cond_18
    invoke-virtual {v7, v9, v3, v2}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGenerateRequestResponse(II[B)V

    goto :goto_10

    .line 499
    :cond_19
    :goto_f
    invoke-virtual {v7, v9, v5, v4}, Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;->remoteSimlockGenerateRequestResponse(II[B)V

    .line 505
    .end local v7    # "cb":Lcom/mediatek/internal/telephony/uicc/IMtkRsuSmlCallback;
    :goto_10
    goto :goto_e

    .line 506
    :cond_1a
    nop

    .line 531
    .end local v2    # "initRequest":[B
    :goto_11
    monitor-exit v10

    .line 532
    return-void

    .line 531
    :catchall_0
    move-exception v2

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

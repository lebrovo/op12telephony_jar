.class public abstract Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;
.super Landroid/os/HwBinder;
.source "IRadioIndicationOp.java"

# interfaces
.implements Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 531
    invoke-direct {p0}, Landroid/os/HwBinder;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IHwBinder;
    .locals 0

    .line 534
    return-object p0
.end method

.method public debug(Landroid/os/NativeHandle;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "fd"    # Landroid/os/NativeHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/NativeHandle;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 547
    .local p2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    return-void
.end method

.method public final getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;
    .locals 3

    .line 584
    new-instance v0, Landroid/hidl/base/V1_0/DebugInfo;

    invoke-direct {v0}, Landroid/hidl/base/V1_0/DebugInfo;-><init>()V

    .line 585
    .local v0, "info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-static {}, Landroid/os/HidlSupport;->getPidIfSharable()I

    move-result v1

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->pid:I

    .line 586
    const-wide/16 v1, 0x0

    iput-wide v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->ptr:J

    .line 587
    const/4 v1, 0x0

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->arch:I

    .line 588
    return-object v0
.end method

.method public final getHashChain()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "[B>;"
        }
    .end annotation

    .line 559
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    new-array v1, v1, [[B

    const/16 v2, 0x20

    new-array v3, v2, [B

    fill-array-data v3, :array_0

    const/4 v4, 0x0

    aput-object v3, v1, v4

    new-array v2, v2, [B

    fill-array-data v2, :array_1

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    nop

    :array_0
    .array-data 1
        -0xft
        0x50t
        -0x63t
        0x44t
        0x11t
        0x59t
        0x3at
        0xft
        0x67t
        0x6dt
        0x46t
        -0x3ft
        -0x3ft
        -0x2t
        -0x61t
        0x3ft
        0x5dt
        -0x11t
        -0x6ft
        0x6bt
        -0x58t
        -0x31t
        0xdt
        -0x41t
        0x2t
        0x5dt
        -0x14t
        -0x47t
        0x2t
        0x8t
        0x57t
        0x9t
    .end array-data

    :array_1
    .array-data 1
        -0x14t
        0x7ft
        -0x29t
        -0x62t
        -0x30t
        0x2dt
        -0x6t
        -0x7bt
        -0x44t
        0x49t
        -0x6ct
        0x26t
        -0x53t
        -0x52t
        0x3et
        -0x42t
        0x23t
        -0x11t
        0x5t
        0x24t
        -0xdt
        -0x33t
        0x69t
        0x57t
        0x13t
        -0x6dt
        0x24t
        -0x48t
        0x3bt
        0x18t
        -0x36t
        0x4ct
    .end array-data
.end method

.method public final interfaceChain()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 539
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp"

    const-string v2, "android.hidl.base@1.0::IBase"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public final interfaceDescriptor()Ljava/lang/String;
    .locals 1

    .line 553
    const-string v0, "vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp"

    return-object v0
.end method

.method public final linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z
    .locals 1
    .param p1, "recipient"    # Landroid/os/IHwBinder$DeathRecipient;
    .param p2, "cookie"    # J

    .line 572
    const/4 v0, 0x1

    return v0
.end method

.method public final notifySyspropsChanged()V
    .locals 0

    .line 594
    invoke-static {}, Landroid/os/HwBinder;->enableInstrumentation()V

    .line 596
    return-void
.end method

.method public onTransact(ILandroid/os/HwParcel;Landroid/os/HwParcel;I)V
    .locals 10
    .param p1, "_hidl_code"    # I
    .param p2, "_hidl_request"    # Landroid/os/HwParcel;
    .param p3, "_hidl_reply"    # Landroid/os/HwParcel;
    .param p4, "_hidl_flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 624
    const/4 v0, 0x1

    const-string v1, "vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp"

    if-eq p1, v0, :cond_6

    const/4 v0, 0x2

    if-eq p1, v0, :cond_5

    const/4 v0, 0x3

    if-eq p1, v0, :cond_4

    const/4 v0, 0x4

    if-eq p1, v0, :cond_3

    const/4 v0, 0x5

    if-eq p1, v0, :cond_2

    const/4 v0, 0x0

    const-string v1, "android.hidl.base@1.0::IBase"

    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_1

    .line 778
    :sswitch_0
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 780
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->notifySyspropsChanged()V

    .line 781
    goto/16 :goto_1

    .line 767
    :sswitch_1
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 769
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;

    move-result-object v1

    .line 770
    .local v1, "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 771
    invoke-virtual {v1, p3}, Landroid/hidl/base/V1_0/DebugInfo;->writeToParcel(Landroid/os/HwParcel;)V

    .line 772
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 773
    goto/16 :goto_1

    .line 757
    .end local v1    # "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    :sswitch_2
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 759
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->ping()V

    .line 760
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 761
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 762
    goto/16 :goto_1

    .line 744
    :sswitch_3
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 746
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->setHALInstrumentation()V

    .line 747
    goto/16 :goto_1

    .line 710
    :sswitch_4
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 712
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->getHashChain()Ljava/util/ArrayList;

    move-result-object v1

    .line 713
    .local v1, "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 715
    new-instance v2, Landroid/os/HwBlob;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Landroid/os/HwBlob;-><init>(I)V

    .line 717
    .local v2, "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 718
    .local v3, "_hidl_vec_size":I
    const-wide/16 v4, 0x8

    invoke-virtual {v2, v4, v5, v3}, Landroid/os/HwBlob;->putInt32(JI)V

    .line 719
    const-wide/16 v4, 0xc

    invoke-virtual {v2, v4, v5, v0}, Landroid/os/HwBlob;->putBool(JZ)V

    .line 720
    new-instance v0, Landroid/os/HwBlob;

    mul-int/lit8 v4, v3, 0x20

    invoke-direct {v0, v4}, Landroid/os/HwBlob;-><init>(I)V

    .line 721
    .local v0, "childBlob":Landroid/os/HwBlob;
    const/4 v4, 0x0

    .local v4, "_hidl_index_0":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 723
    mul-int/lit8 v5, v4, 0x20

    int-to-long v5, v5

    .line 724
    .local v5, "_hidl_array_offset_1":J
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    .line 726
    .local v7, "_hidl_array_item_1":[B
    if-eqz v7, :cond_0

    array-length v8, v7

    const/16 v9, 0x20

    if-ne v8, v9, :cond_0

    .line 730
    invoke-virtual {v0, v5, v6, v7}, Landroid/os/HwBlob;->putInt8Array(J[B)V

    .line 731
    nop

    .line 721
    .end local v5    # "_hidl_array_offset_1":J
    .end local v7    # "_hidl_array_item_1":[B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 727
    .restart local v5    # "_hidl_array_offset_1":J
    .restart local v7    # "_hidl_array_item_1":[B
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Array element is not of the expected length"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 734
    .end local v4    # "_hidl_index_0":I
    .end local v5    # "_hidl_array_offset_1":J
    .end local v7    # "_hidl_array_item_1":[B
    :cond_1
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5, v0}, Landroid/os/HwBlob;->putBlob(JLandroid/os/HwBlob;)V

    .line 736
    .end local v0    # "childBlob":Landroid/os/HwBlob;
    .end local v3    # "_hidl_vec_size":I
    invoke-virtual {p3, v2}, Landroid/os/HwParcel;->writeBuffer(Landroid/os/HwBlob;)V

    .line 738
    .end local v2    # "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 739
    goto/16 :goto_1

    .line 699
    .end local v1    # "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    :sswitch_5
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 701
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    .line 702
    .local v1, "_hidl_out_descriptor":Ljava/lang/String;
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 703
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeString(Ljava/lang/String;)V

    .line 704
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 705
    goto :goto_1

    .line 687
    .end local v1    # "_hidl_out_descriptor":Ljava/lang/String;
    :sswitch_6
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 689
    invoke-virtual {p2}, Landroid/os/HwParcel;->readNativeHandle()Landroid/os/NativeHandle;

    move-result-object v1

    .line 690
    .local v1, "fd":Landroid/os/NativeHandle;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStringVector()Ljava/util/ArrayList;

    move-result-object v2

    .line 691
    .local v2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->debug(Landroid/os/NativeHandle;Ljava/util/ArrayList;)V

    .line 692
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 693
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 694
    goto :goto_1

    .line 676
    .end local v1    # "fd":Landroid/os/NativeHandle;
    .end local v2    # "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :sswitch_7
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 678
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->interfaceChain()Ljava/util/ArrayList;

    move-result-object v1

    .line 679
    .local v1, "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 680
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStringVector(Ljava/util/ArrayList;)V

    .line 681
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 682
    goto :goto_1

    .line 667
    .end local v1    # "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 669
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 670
    .local v0, "type":I
    invoke-virtual {p0, v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->enterSCBMInd(I)V

    .line 671
    goto :goto_1

    .line 658
    .end local v0    # "type":I
    :cond_3
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 660
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 661
    .restart local v0    # "type":I
    invoke-virtual {p0, v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->exitSCBMInd(I)V

    .line 662
    goto :goto_1

    .line 648
    .end local v0    # "type":I
    :cond_4
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 650
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 651
    .restart local v0    # "type":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32Vector()Ljava/util/ArrayList;

    move-result-object v1

    .line 652
    .local v1, "modulation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->responseModulationInfoInd(ILjava/util/ArrayList;)V

    .line 653
    goto :goto_1

    .line 637
    .end local v0    # "type":I
    .end local v1    # "modulation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_5
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 639
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 640
    .restart local v0    # "type":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 641
    .local v1, "eventId":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 642
    .local v2, "eventString":Ljava/lang/String;
    invoke-virtual {p0, v0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->onRsuEvent(IILjava/lang/String;)V

    .line 643
    goto :goto_1

    .line 627
    .end local v0    # "type":I
    .end local v1    # "eventId":I
    .end local v2    # "eventString":Ljava/lang/String;
    :cond_6
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 629
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 630
    .restart local v0    # "type":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 631
    .restart local v1    # "eventId":I
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->onSimMeLockEvent(II)V

    .line 632
    nop

    .line 790
    .end local v0    # "type":I
    .end local v1    # "eventId":I
    :goto_1
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0xf43484e -> :sswitch_7
        0xf444247 -> :sswitch_6
        0xf445343 -> :sswitch_5
        0xf485348 -> :sswitch_4
        0xf494e54 -> :sswitch_3
        0xf504e47 -> :sswitch_2
        0xf524546 -> :sswitch_1
        0xf535953 -> :sswitch_0
    .end sparse-switch
.end method

.method public final ping()V
    .locals 0

    .line 578
    return-void
.end method

.method public queryLocalInterface(Ljava/lang/String;)Landroid/os/IHwInterface;
    .locals 1
    .param p1, "descriptor"    # Ljava/lang/String;

    .line 606
    const-string v0, "vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 607
    return-object p0

    .line 609
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public registerAsService(Ljava/lang/String;)V
    .locals 0
    .param p1, "serviceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 613
    invoke-virtual {p0, p1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->registerService(Ljava/lang/String;)V

    .line 614
    return-void
.end method

.method public final setHALInstrumentation()V
    .locals 0

    .line 568
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 618
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp$Stub;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "@Stub"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final unlinkToDeath(Landroid/os/IHwBinder$DeathRecipient;)Z
    .locals 1
    .param p1, "recipient"    # Landroid/os/IHwBinder$DeathRecipient;

    .line 600
    const/4 v0, 0x1

    return v0
.end method

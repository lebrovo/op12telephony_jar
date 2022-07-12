.class public abstract Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;
.super Landroid/os/HwBinder;
.source "IRadioOp.java"

# interfaces
.implements Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 931
    invoke-direct {p0}, Landroid/os/HwBinder;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IHwBinder;
    .locals 0

    .line 934
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

    .line 947
    .local p2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    return-void
.end method

.method public final getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;
    .locals 3

    .line 984
    new-instance v0, Landroid/hidl/base/V1_0/DebugInfo;

    invoke-direct {v0}, Landroid/hidl/base/V1_0/DebugInfo;-><init>()V

    .line 985
    .local v0, "info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-static {}, Landroid/os/HidlSupport;->getPidIfSharable()I

    move-result v1

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->pid:I

    .line 986
    const-wide/16 v1, 0x0

    iput-wide v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->ptr:J

    .line 987
    const/4 v1, 0x0

    iput v1, v0, Landroid/hidl/base/V1_0/DebugInfo;->arch:I

    .line 988
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

    .line 959
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
        0x78t
        -0x16t
        0x2dt
        0x42t
        0x1ct
        0x59t
        0x33t
        0x7ft
        0x2bt
        -0x28t
        0x56t
        -0x5t
        0x5bt
        0x50t
        -0x46t
        -0x59t
        -0x6et
        0x2ct
        -0x6ft
        -0x47t
        0x41t
        -0x52t
        0x20t
        0x39t
        0x1t
        -0x67t
        0x71t
        0x5at
        -0xbt
        0x64t
        0x30t
        -0x10t
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

    .line 939
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "vendor.mediatek.hardware.radio_op@3.0::IRadioOp"

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

    .line 953
    const-string v0, "vendor.mediatek.hardware.radio_op@3.0::IRadioOp"

    return-object v0
.end method

.method public final linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z
    .locals 1
    .param p1, "recipient"    # Landroid/os/IHwBinder$DeathRecipient;
    .param p2, "cookie"    # J

    .line 972
    const/4 v0, 0x1

    return v0
.end method

.method public final notifySyspropsChanged()V
    .locals 0

    .line 994
    invoke-static {}, Landroid/os/HwBinder;->enableInstrumentation()V

    .line 996
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

    .line 1024
    const/4 v0, 0x0

    const-string v1, "vendor.mediatek.hardware.radio_op@3.0::IRadioOp"

    packed-switch p1, :pswitch_data_0

    const-string v1, "android.hidl.base@1.0::IBase"

    sparse-switch p1, :sswitch_data_0

    goto/16 :goto_1

    .line 1334
    :sswitch_0
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1336
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->notifySyspropsChanged()V

    .line 1337
    goto/16 :goto_1

    .line 1323
    :sswitch_1
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1325
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->getDebugInfo()Landroid/hidl/base/V1_0/DebugInfo;

    move-result-object v1

    .line 1326
    .local v1, "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1327
    invoke-virtual {v1, p3}, Landroid/hidl/base/V1_0/DebugInfo;->writeToParcel(Landroid/os/HwParcel;)V

    .line 1328
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1329
    goto/16 :goto_1

    .line 1313
    .end local v1    # "_hidl_out_info":Landroid/hidl/base/V1_0/DebugInfo;
    :sswitch_2
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1315
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->ping()V

    .line 1316
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1317
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1318
    goto/16 :goto_1

    .line 1300
    :sswitch_3
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1302
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setHALInstrumentation()V

    .line 1303
    goto/16 :goto_1

    .line 1266
    :sswitch_4
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1268
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->getHashChain()Ljava/util/ArrayList;

    move-result-object v1

    .line 1269
    .local v1, "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1271
    new-instance v2, Landroid/os/HwBlob;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Landroid/os/HwBlob;-><init>(I)V

    .line 1273
    .local v2, "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1274
    .local v3, "_hidl_vec_size":I
    const-wide/16 v4, 0x8

    invoke-virtual {v2, v4, v5, v3}, Landroid/os/HwBlob;->putInt32(JI)V

    .line 1275
    const-wide/16 v4, 0xc

    invoke-virtual {v2, v4, v5, v0}, Landroid/os/HwBlob;->putBool(JZ)V

    .line 1276
    new-instance v0, Landroid/os/HwBlob;

    mul-int/lit8 v4, v3, 0x20

    invoke-direct {v0, v4}, Landroid/os/HwBlob;-><init>(I)V

    .line 1277
    .local v0, "childBlob":Landroid/os/HwBlob;
    const/4 v4, 0x0

    .local v4, "_hidl_index_0":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 1279
    mul-int/lit8 v5, v4, 0x20

    int-to-long v5, v5

    .line 1280
    .local v5, "_hidl_array_offset_1":J
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    .line 1282
    .local v7, "_hidl_array_item_1":[B
    if-eqz v7, :cond_0

    array-length v8, v7

    const/16 v9, 0x20

    if-ne v8, v9, :cond_0

    .line 1286
    invoke-virtual {v0, v5, v6, v7}, Landroid/os/HwBlob;->putInt8Array(J[B)V

    .line 1287
    nop

    .line 1277
    .end local v5    # "_hidl_array_offset_1":J
    .end local v7    # "_hidl_array_item_1":[B
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1283
    .restart local v5    # "_hidl_array_offset_1":J
    .restart local v7    # "_hidl_array_item_1":[B
    :cond_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Array element is not of the expected length"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1290
    .end local v4    # "_hidl_index_0":I
    .end local v5    # "_hidl_array_offset_1":J
    .end local v7    # "_hidl_array_item_1":[B
    :cond_1
    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5, v0}, Landroid/os/HwBlob;->putBlob(JLandroid/os/HwBlob;)V

    .line 1292
    .end local v0    # "childBlob":Landroid/os/HwBlob;
    .end local v3    # "_hidl_vec_size":I
    invoke-virtual {p3, v2}, Landroid/os/HwParcel;->writeBuffer(Landroid/os/HwBlob;)V

    .line 1294
    .end local v2    # "_hidl_blob":Landroid/os/HwBlob;
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1295
    goto/16 :goto_1

    .line 1255
    .end local v1    # "_hidl_out_hashchain":Ljava/util/ArrayList;, "Ljava/util/ArrayList<[B>;"
    :sswitch_5
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1257
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->interfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    .line 1258
    .local v1, "_hidl_out_descriptor":Ljava/lang/String;
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1259
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeString(Ljava/lang/String;)V

    .line 1260
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1261
    goto/16 :goto_1

    .line 1243
    .end local v1    # "_hidl_out_descriptor":Ljava/lang/String;
    :sswitch_6
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1245
    invoke-virtual {p2}, Landroid/os/HwParcel;->readNativeHandle()Landroid/os/NativeHandle;

    move-result-object v1

    .line 1246
    .local v1, "fd":Landroid/os/NativeHandle;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStringVector()Ljava/util/ArrayList;

    move-result-object v2

    .line 1247
    .local v2, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->debug(Landroid/os/NativeHandle;Ljava/util/ArrayList;)V

    .line 1248
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1249
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1250
    goto/16 :goto_1

    .line 1232
    .end local v1    # "fd":Landroid/os/NativeHandle;
    .end local v2    # "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :sswitch_7
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1234
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->interfaceChain()Ljava/util/ArrayList;

    move-result-object v1

    .line 1235
    .local v1, "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1236
    invoke-virtual {p3, v1}, Landroid/os/HwParcel;->writeStringVector(Ljava/util/ArrayList;)V

    .line 1237
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1238
    goto/16 :goto_1

    .line 1223
    .end local v1    # "_hidl_out_descriptors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_0
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1225
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1226
    .local v0, "serial":I
    invoke-virtual {p0, v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->exitSCBM(I)V

    .line 1227
    goto/16 :goto_1

    .line 1213
    .end local v0    # "serial":I
    :pswitch_1
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1215
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1216
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 1217
    .local v1, "count":I
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->updateRcsSessionInfo(II)V

    .line 1218
    goto/16 :goto_1

    .line 1202
    .end local v0    # "serial":I
    .end local v1    # "count":I
    :pswitch_2
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1204
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1205
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 1206
    .local v1, "mode":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 1207
    .local v2, "featureTags":Ljava/lang/String;
    invoke-virtual {p0, v0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->updateRcsCapabilities(IILjava/lang/String;)V

    .line 1208
    goto/16 :goto_1

    .line 1192
    .end local v0    # "serial":I
    .end local v1    # "mode":I
    .end local v2    # "featureTags":Ljava/lang/String;
    :pswitch_3
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1194
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1195
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readBool()Z

    move-result v1

    .line 1196
    .local v1, "status":Z
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->switchRcsRoiStatus(IZ)V

    .line 1197
    goto/16 :goto_1

    .line 1182
    .end local v0    # "serial":I
    .end local v1    # "status":Z
    :pswitch_4
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1184
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v0

    invoke-static {v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioResponse;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioResponse;

    move-result-object v0

    .line 1185
    .local v0, "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioResponse;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v1

    invoke-static {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioIndication;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioIndication;

    move-result-object v1

    .line 1186
    .local v1, "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioIndication;
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setResponseFunctionsRcs(Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioResponse;Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioIndication;)V

    .line 1187
    goto/16 :goto_1

    .line 1173
    .end local v0    # "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioResponse;
    .end local v1    # "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IRcsRadioIndication;
    :pswitch_5
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1175
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1176
    .local v0, "serial":I
    invoke-virtual {p0, v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->cancelDeviceSwitch(I)V

    .line 1177
    goto/16 :goto_1

    .line 1162
    .end local v0    # "serial":I
    :pswitch_6
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1164
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1165
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 1166
    .local v1, "number":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 1167
    .local v2, "deviceId":Ljava/lang/String;
    invoke-virtual {p0, v0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->deviceSwitch(ILjava/lang/String;Ljava/lang/String;)V

    .line 1168
    goto/16 :goto_1

    .line 1151
    .end local v0    # "serial":I
    .end local v1    # "number":Ljava/lang/String;
    .end local v2    # "deviceId":Ljava/lang/String;
    :pswitch_7
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1153
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1154
    .restart local v0    # "serial":I
    new-instance v1, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;

    invoke-direct {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;-><init>()V

    .line 1155
    .local v1, "rri":Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;
    invoke-virtual {v1, p2}, Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;->readFromParcel(Landroid/os/HwParcel;)V

    .line 1156
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->sendRsuRequest(ILvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;)V

    .line 1157
    goto/16 :goto_1

    .line 1142
    .end local v0    # "serial":I
    .end local v1    # "rri":Lvendor/mediatek/hardware/radio_op/V3_0/RsuRequestInfo;
    :pswitch_8
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1144
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1145
    .restart local v0    # "serial":I
    invoke-virtual {p0, v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->getDisable2G(I)V

    .line 1146
    goto/16 :goto_1

    .line 1132
    .end local v0    # "serial":I
    :pswitch_9
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1134
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1135
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readBool()Z

    move-result v1

    .line 1136
    .local v1, "mode":Z
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setDisable2G(IZ)V

    .line 1137
    goto/16 :goto_1

    .line 1121
    .end local v0    # "serial":I
    .end local v1    # "mode":Z
    :pswitch_a
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1123
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1124
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 1125
    .local v1, "category":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readBool()Z

    move-result v2

    .line 1126
    .local v2, "isForceEcc":Z
    invoke-virtual {p0, v0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setEmergencyCallConfig(IIZ)V

    .line 1127
    goto/16 :goto_1

    .line 1111
    .end local v0    # "serial":I
    .end local v1    # "category":I
    .end local v2    # "isForceEcc":Z
    :pswitch_b
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1113
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1114
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 1115
    .local v1, "from":Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->cancelUssiFrom(ILjava/lang/String;)V

    .line 1116
    goto/16 :goto_1

    .line 1099
    .end local v0    # "serial":I
    .end local v1    # "from":Ljava/lang/String;
    :pswitch_c
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1101
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1102
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 1103
    .restart local v1    # "from":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v2

    .line 1104
    .local v2, "action":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 1105
    .local v3, "ussi":Ljava/lang/String;
    invoke-virtual {p0, v0, v1, v2, v3}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->sendUssiFrom(ILjava/lang/String;ILjava/lang/String;)V

    .line 1106
    goto/16 :goto_1

    .line 1088
    .end local v0    # "serial":I
    .end local v1    # "from":Ljava/lang/String;
    .end local v2    # "action":I
    .end local v3    # "ussi":Ljava/lang/String;
    :pswitch_d
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1090
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1091
    .restart local v0    # "serial":I
    new-instance v1, Lvendor/mediatek/hardware/radio_op/V3_0/DialFrom;

    invoke-direct {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/DialFrom;-><init>()V

    .line 1092
    .local v1, "dialInfo":Lvendor/mediatek/hardware/radio_op/V3_0/DialFrom;
    invoke-virtual {v1, p2}, Lvendor/mediatek/hardware/radio_op/V3_0/DialFrom;->readFromParcel(Landroid/os/HwParcel;)V

    .line 1093
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->dialFrom(ILvendor/mediatek/hardware/radio_op/V3_0/DialFrom;)V

    .line 1094
    goto :goto_1

    .line 1078
    .end local v0    # "serial":I
    .end local v1    # "dialInfo":Lvendor/mediatek/hardware/radio_op/V3_0/DialFrom;
    :pswitch_e
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1080
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1081
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 1082
    .local v1, "mode":I
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->getRxTestResult(II)V

    .line 1083
    goto :goto_1

    .line 1068
    .end local v0    # "serial":I
    .end local v1    # "mode":I
    :pswitch_f
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1070
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1071
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v1

    .line 1072
    .local v1, "antType":I
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setRxTestConfig(II)V

    .line 1073
    goto :goto_1

    .line 1057
    .end local v0    # "serial":I
    .end local v1    # "antType":I
    :pswitch_10
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1059
    invoke-virtual {p2}, Landroid/os/HwParcel;->readInt32()I

    move-result v0

    .line 1060
    .restart local v0    # "serial":I
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v1

    .line 1061
    .local v1, "fromMsisdn":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 1062
    .local v2, "toMsisdn":Ljava/lang/String;
    invoke-virtual {p0, v0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setIncomingVirtualLine(ILjava/lang/String;Ljava/lang/String;)V

    .line 1063
    goto :goto_1

    .line 1047
    .end local v0    # "serial":I
    .end local v1    # "fromMsisdn":Ljava/lang/String;
    .end local v2    # "toMsisdn":Ljava/lang/String;
    :pswitch_11
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1049
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v0

    invoke-static {v0}, Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioResponseOp;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioResponseOp;

    move-result-object v0

    .line 1050
    .local v0, "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioResponseOp;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v1

    invoke-static {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioIndicationOp;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioIndicationOp;

    move-result-object v1

    .line 1051
    .local v1, "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioIndicationOp;
    invoke-virtual {p0, v0, v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setResponseFunctionsIms(Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioResponseOp;Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioIndicationOp;)V

    .line 1052
    goto :goto_1

    .line 1035
    .end local v0    # "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioResponseOp;
    .end local v1    # "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IImsRadioIndicationOp;
    :pswitch_12
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1037
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v1

    invoke-static {v1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioResponseOp;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IRadioResponseOp;

    move-result-object v1

    .line 1038
    .local v1, "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IRadioResponseOp;
    invoke-virtual {p2}, Landroid/os/HwParcel;->readStrongBinder()Landroid/os/IHwBinder;

    move-result-object v2

    invoke-static {v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;->asInterface(Landroid/os/IHwBinder;)Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;

    move-result-object v2

    .line 1039
    .local v2, "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;
    invoke-virtual {p0, v1, v2}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->setResponseFunctions(Lvendor/mediatek/hardware/radio_op/V3_0/IRadioResponseOp;Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;)V

    .line 1040
    invoke-virtual {p3, v0}, Landroid/os/HwParcel;->writeStatus(I)V

    .line 1041
    invoke-virtual {p3}, Landroid/os/HwParcel;->send()V

    .line 1042
    goto :goto_1

    .line 1027
    .end local v1    # "radioResponse":Lvendor/mediatek/hardware/radio_op/V3_0/IRadioResponseOp;
    .end local v2    # "radioIndication":Lvendor/mediatek/hardware/radio_op/V3_0/IRadioIndicationOp;
    :pswitch_13
    invoke-virtual {p2, v1}, Landroid/os/HwParcel;->enforceInterface(Ljava/lang/String;)V

    .line 1029
    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->responseAcknowledgement()V

    .line 1030
    nop

    .line 1346
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

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

    .line 978
    return-void
.end method

.method public queryLocalInterface(Ljava/lang/String;)Landroid/os/IHwInterface;
    .locals 1
    .param p1, "descriptor"    # Ljava/lang/String;

    .line 1006
    const-string v0, "vendor.mediatek.hardware.radio_op@3.0::IRadioOp"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1007
    return-object p0

    .line 1009
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

    .line 1013
    invoke-virtual {p0, p1}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->registerService(Ljava/lang/String;)V

    .line 1014
    return-void
.end method

.method public final setHALInstrumentation()V
    .locals 0

    .line 968
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1018
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lvendor/mediatek/hardware/radio_op/V3_0/IRadioOp$Stub;->interfaceDescriptor()Ljava/lang/String;

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

    .line 1000
    const/4 v0, 0x1

    return v0
.end method

.class Lcom/mediatek/op12/telephony/Op12RsuSml12$2;
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

    .line 535
    iput-object p1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 538
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 539
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " what = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 540
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x7

    if-eq v1, v2, :cond_0

    .line 547
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    const-string v2, "Unknown urc or urc that need not handle"

    invoke-static {v1, v2}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$200(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    goto :goto_0

    .line 542
    :cond_0
    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, [Ljava/lang/String;

    .line 543
    .local v1, "event":[Ljava/lang/String;
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12RsuSml12$2;->this$0:Lcom/mediatek/op12/telephony/Op12RsuSml12;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RSU_MESSAGE_UNSOL_RSU_EVENT eventId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget-object v4, v1, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " eventString = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    aget-object v4, v1, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/op12/telephony/Op12RsuSml12;->access$000(Lcom/mediatek/op12/telephony/Op12RsuSml12;Ljava/lang/String;)V

    .line 545
    nop

    .line 550
    .end local v1    # "event":[Ljava/lang/String;
    :goto_0
    return-void
.end method

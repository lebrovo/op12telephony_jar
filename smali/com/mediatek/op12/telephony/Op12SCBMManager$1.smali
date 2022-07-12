.class Lcom/mediatek/op12/telephony/Op12SCBMManager$1;
.super Ljava/lang/Object;
.source "Op12SCBMManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/op12/telephony/Op12SCBMManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/op12/telephony/Op12SCBMManager;


# direct methods
.method constructor <init>(Lcom/mediatek/op12/telephony/Op12SCBMManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mediatek/op12/telephony/Op12SCBMManager;

    .line 78
    iput-object p1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager$1;->this$0:Lcom/mediatek/op12/telephony/Op12SCBMManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager$1;->this$0:Lcom/mediatek/op12/telephony/Op12SCBMManager;

    invoke-virtual {v0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->exitSCBM()V

    .line 82
    return-void
.end method

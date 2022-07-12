.class public Lcom/mediatek/op12/telephony/Op12SCBMManager;
.super Lcom/mediatek/internal/telephony/scbm/SCBMManagerDefault;
.source "Op12SCBMManager.java"


# static fields
.field private static final DBG:Z = true

.field private static final DEFAULT_SCM_EXIT_TIMER_VALUE:I = 0x493e0

.field public static final LOG_TAG:Ljava/lang/String; = "Op12SCBMManager"

.field public static final PHONE_IN_SCM_STATE:Ljava/lang/String; = "phoneinSCMState"


# instance fields
.field private mCi:Lcom/mediatek/opcommon/telephony/MtkRilOp;

.field private mContext:Landroid/content/Context;

.field private mExitScmRunnable:Ljava/lang/Runnable;

.field protected mIsPhoneInScmState:Z

.field private mPhoneId:I

.field private mScmExitRespRegistrant:Landroid/os/Registrant;

.field protected mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/internal/telephony/CommandsInterface;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "phoneId"    # I
    .param p3, "ci"    # Lcom/android/internal/telephony/CommandsInterface;

    .line 86
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/internal/telephony/scbm/SCBMManagerDefault;-><init>(Landroid/content/Context;ILcom/android/internal/telephony/CommandsInterface;)V

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mIsPhoneInScmState:Z

    .line 78
    new-instance v0, Lcom/mediatek/op12/telephony/Op12SCBMManager$1;

    invoke-direct {v0, p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager$1;-><init>(Lcom/mediatek/op12/telephony/Op12SCBMManager;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mExitScmRunnable:Ljava/lang/Runnable;

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Initialize Op12SCBMManager"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Op12SCBMManager"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iput p2, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mPhoneId:I

    .line 89
    iput-object p1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mContext:Landroid/content/Context;

    .line 90
    nop

    .line 91
    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 92
    .local v0, "pm":Landroid/os/PowerManager;
    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 94
    move-object v1, p3

    check-cast v1, Lcom/mediatek/internal/telephony/MtkRIL;

    invoke-virtual {v1}, Lcom/mediatek/internal/telephony/MtkRIL;->getRilOp()Lcom/mediatek/internal/telephony/IMtkRilOp;

    move-result-object v1

    check-cast v1, Lcom/mediatek/opcommon/telephony/MtkRilOp;

    iput-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mCi:Lcom/mediatek/opcommon/telephony/MtkRilOp;

    .line 95
    const/4 v3, 0x0

    invoke-virtual {v1, p0, v2, v3}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->setSCBM(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 96
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mCi:Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v2, 0x2

    invoke-virtual {v1, p0, v2, v3}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->registerForExitSCBM(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 98
    return-void
.end method

.method private handleEnterSCBM(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleEnterSCBM, isInScm()="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->isInScm()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    const-string v1, "Op12SCBMManager"

    invoke-static {v1, v0}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->isInScm()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->setIsInScm(Z)V

    .line 131
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mExitScmRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 133
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 138
    :cond_0
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->sendSCBMChange()V

    .line 141
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->setIsInScm(Z)V

    .line 144
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->sendSCBMChange()V

    .line 148
    const-wide/32 v0, 0x493e0

    .line 149
    .local v0, "delayInMillis":J
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mExitScmRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v2, v0, v1}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 151
    iget-object v2, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 152
    return-void
.end method

.method private sendSCBMChange()V
    .locals 3

    .line 172
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mediatek.intent.action.ACTION_SCBM_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 173
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->isInScm()Z

    move-result v1

    const-string v2, "phoneinSCMState"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 174
    iget v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mPhoneId:I

    invoke-static {v0, v1}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;I)V

    .line 175
    const/4 v1, -0x1

    invoke-static {v0, v1}, Landroid/app/ActivityManager;->broadcastStickyIntent(Landroid/content/Intent;I)V

    .line 176
    const-string v1, "Op12SCBMManager"

    const-string v2, "sendSCBMChange"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    return-void
.end method


# virtual methods
.method public exitSCBM()V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mCi:Lcom/mediatek/opcommon/telephony/MtkRilOp;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mediatek/opcommon/telephony/MtkRilOp;->exitSCBM(Landroid/os/Message;)V

    .line 160
    return-void
.end method

.method protected handleExitSCBM(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 188
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 190
    .local v0, "ar":Landroid/os/AsyncResult;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleExitSCBM,ar.exception , isInScm="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->isInScm()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 190
    const-string v2, "Op12SCBMManager"

    invoke-static {v2, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mExitScmRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 196
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mScmExitRespRegistrant:Landroid/os/Registrant;

    if-eqz v1, :cond_0

    .line 197
    invoke-virtual {v1, v0}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    .line 200
    :cond_0
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v1, :cond_3

    .line 201
    invoke-virtual {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->isInScm()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 202
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->setIsInScm(Z)V

    .line 206
    :cond_1
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 207
    iget-object v1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 211
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->sendSCBMChange()V

    .line 213
    :cond_3
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .line 108
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 116
    invoke-super {p0, p1}, Lcom/mediatek/internal/telephony/scbm/SCBMManagerDefault;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 113
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->handleExitSCBM(Landroid/os/Message;)V

    .line 114
    goto :goto_0

    .line 110
    :cond_1
    invoke-direct {p0, p1}, Lcom/mediatek/op12/telephony/Op12SCBMManager;->handleEnterSCBM(Landroid/os/Message;)V

    .line 111
    nop

    .line 119
    :goto_0
    return-void
.end method

.method public isInScm()Z
    .locals 1

    .line 163
    iget-boolean v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mIsPhoneInScmState:Z

    return v0
.end method

.method public setIsInScm(Z)V
    .locals 0
    .param p1, "isInScm"    # Z

    .line 167
    iput-boolean p1, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mIsPhoneInScmState:Z

    .line 168
    return-void
.end method

.method public setOnScbModeExitResponse(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 180
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    iput-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mScmExitRespRegistrant:Landroid/os/Registrant;

    .line 181
    return-void
.end method

.method public unsetOnScbModeExitResponse(Landroid/os/Handler;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;

    .line 184
    iget-object v0, p0, Lcom/mediatek/op12/telephony/Op12SCBMManager;->mScmExitRespRegistrant:Landroid/os/Registrant;

    invoke-virtual {v0}, Landroid/os/Registrant;->clear()V

    .line 185
    return-void
.end method

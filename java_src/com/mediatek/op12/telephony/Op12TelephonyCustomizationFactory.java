package com.mediatek.op12.telephony;

import android.content.Context;
import com.android.internal.telephony.CommandsInterface;
import com.mediatek.internal.telephony.OpTelephonyCustomizationFactoryBase;
import com.mediatek.internal.telephony.dataconnection.IDataConnectionExt;
import com.mediatek.internal.telephony.scbm.ISCBMManager;
import com.mediatek.internal.telephony.selfactivation.ISelfActivation;
import com.mediatek.internal.telephony.uicc.IMtkRsuSml;
import com.mediatek.op12.telephony.selfactivation.SelfActivationPcoBasedSm;

public class Op12TelephonyCustomizationFactory extends OpTelephonyCustomizationFactoryBase {
    public IDataConnectionExt makeDataConnectionExt(Context context) {
        return new Op12DataConnectionExt(context);
    }

    public ISelfActivation makeSelfActivationInstance(int phoneId) {
        return new SelfActivationPcoBasedSm(phoneId);
    }

    public ISCBMManager makeSCBMManager(Context context, int phoneId, CommandsInterface ci) {
        return new Op12SCBMManager(context, phoneId, ci);
    }

    public IMtkRsuSml makeRsuSml(Context context, CommandsInterface[] ci) {
        return new Op12RsuSml12(context, ci);
    }
}

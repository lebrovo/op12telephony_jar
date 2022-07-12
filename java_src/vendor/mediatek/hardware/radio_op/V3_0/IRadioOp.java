package vendor.mediatek.hardware.radio_op.V3_0;

import android.hidl.base.V1_0.DebugInfo;
import android.hidl.base.V1_0.IBase;
import android.os.HidlSupport;
import android.os.HwBinder;
import android.os.HwBlob;
import android.os.HwParcel;
import android.os.IHwBinder;
import android.os.IHwInterface;
import android.os.NativeHandle;
import android.os.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;

public interface IRadioOp extends IBase {
    public static final String kInterfaceName = "vendor.mediatek.hardware.radio_op@3.0::IRadioOp";

    @Override // android.hidl.base.V1_0.IBase
    IHwBinder asBinder();

    void cancelDeviceSwitch(int i) throws RemoteException;

    void cancelUssiFrom(int i, String str) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void debug(NativeHandle nativeHandle, ArrayList<String> arrayList) throws RemoteException;

    void deviceSwitch(int i, String str, String str2) throws RemoteException;

    void dialFrom(int i, DialFrom dialFrom) throws RemoteException;

    void exitSCBM(int i) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    DebugInfo getDebugInfo() throws RemoteException;

    void getDisable2G(int i) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    ArrayList<byte[]> getHashChain() throws RemoteException;

    void getRxTestResult(int i, int i2) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    ArrayList<String> interfaceChain() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    String interfaceDescriptor() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    boolean linkToDeath(IHwBinder.DeathRecipient deathRecipient, long j) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void notifySyspropsChanged() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void ping() throws RemoteException;

    void responseAcknowledgement() throws RemoteException;

    void sendRsuRequest(int i, RsuRequestInfo rsuRequestInfo) throws RemoteException;

    void sendUssiFrom(int i, String str, int i2, String str2) throws RemoteException;

    void setDisable2G(int i, boolean z) throws RemoteException;

    void setEmergencyCallConfig(int i, int i2, boolean z) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void setHALInstrumentation() throws RemoteException;

    void setIncomingVirtualLine(int i, String str, String str2) throws RemoteException;

    void setResponseFunctions(IRadioResponseOp iRadioResponseOp, IRadioIndicationOp iRadioIndicationOp) throws RemoteException;

    void setResponseFunctionsIms(IImsRadioResponseOp iImsRadioResponseOp, IImsRadioIndicationOp iImsRadioIndicationOp) throws RemoteException;

    void setResponseFunctionsRcs(IRcsRadioResponse iRcsRadioResponse, IRcsRadioIndication iRcsRadioIndication) throws RemoteException;

    void setRxTestConfig(int i, int i2) throws RemoteException;

    void switchRcsRoiStatus(int i, boolean z) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    boolean unlinkToDeath(IHwBinder.DeathRecipient deathRecipient) throws RemoteException;

    void updateRcsCapabilities(int i, int i2, String str) throws RemoteException;

    void updateRcsSessionInfo(int i, int i2) throws RemoteException;

    static default IRadioOp asInterface(IHwBinder binder) {
        if (binder == null) {
            return null;
        }
        IHwInterface iface = binder.queryLocalInterface(kInterfaceName);
        if (iface != null && (iface instanceof IRadioOp)) {
            return (IRadioOp) iface;
        }
        IRadioOp proxy = new Proxy(binder);
        try {
            Iterator<String> it = proxy.interfaceChain().iterator();
            while (it.hasNext()) {
                if (it.next().equals(kInterfaceName)) {
                    return proxy;
                }
            }
        } catch (RemoteException e) {
        }
        return null;
    }

    static default IRadioOp castFrom(IHwInterface iface) {
        if (iface == null) {
            return null;
        }
        return asInterface(iface.asBinder());
    }

    static default IRadioOp getService(String serviceName, boolean retry) throws RemoteException {
        return asInterface(HwBinder.getService(kInterfaceName, serviceName, retry));
    }

    static default IRadioOp getService(boolean retry) throws RemoteException {
        return getService("default", retry);
    }

    static default IRadioOp getService(String serviceName) throws RemoteException {
        return asInterface(HwBinder.getService(kInterfaceName, serviceName));
    }

    static default IRadioOp getService() throws RemoteException {
        return getService("default");
    }

    public static final class Proxy implements IRadioOp {
        private IHwBinder mRemote;

        public Proxy(IHwBinder remote) {
            Objects.requireNonNull(remote);
            this.mRemote = remote;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public IHwBinder asBinder() {
            return this.mRemote;
        }

        public String toString() {
            try {
                return interfaceDescriptor() + "@Proxy";
            } catch (RemoteException e) {
                return "[class or subclass of vendor.mediatek.hardware.radio_op@3.0::IRadioOp]@Proxy";
            }
        }

        public final boolean equals(Object other) {
            return HidlSupport.interfacesEqual(this, other);
        }

        public final int hashCode() {
            return asBinder().hashCode();
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void responseAcknowledgement() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(1, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setResponseFunctions(IRadioResponseOp radioResponse, IRadioIndicationOp radioIndication) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            IHwBinder iHwBinder = null;
            _hidl_request.writeStrongBinder(radioResponse == null ? null : radioResponse.asBinder());
            if (radioIndication != null) {
                iHwBinder = radioIndication.asBinder();
            }
            _hidl_request.writeStrongBinder(iHwBinder);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(2, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setResponseFunctionsIms(IImsRadioResponseOp radioResponse, IImsRadioIndicationOp radioIndication) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            IHwBinder iHwBinder = null;
            _hidl_request.writeStrongBinder(radioResponse == null ? null : radioResponse.asBinder());
            if (radioIndication != null) {
                iHwBinder = radioIndication.asBinder();
            }
            _hidl_request.writeStrongBinder(iHwBinder);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(3, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setIncomingVirtualLine(int serial, String fromMsisdn, String toMsisdn) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeString(fromMsisdn);
            _hidl_request.writeString(toMsisdn);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(4, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setRxTestConfig(int serial, int antType) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeInt32(antType);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(5, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void getRxTestResult(int serial, int mode) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeInt32(mode);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(6, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void dialFrom(int serial, DialFrom dialInfo) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            dialInfo.writeToParcel(_hidl_request);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(7, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void sendUssiFrom(int serial, String from, int action, String ussi) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeString(from);
            _hidl_request.writeInt32(action);
            _hidl_request.writeString(ussi);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(8, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void cancelUssiFrom(int serial, String from) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeString(from);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(9, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setEmergencyCallConfig(int serial, int category, boolean isForceEcc) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeInt32(category);
            _hidl_request.writeBool(isForceEcc);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(10, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setDisable2G(int serial, boolean mode) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeBool(mode);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(11, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void getDisable2G(int serial) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(12, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void sendRsuRequest(int serial, RsuRequestInfo rri) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            rri.writeToParcel(_hidl_request);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(13, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void deviceSwitch(int serial, String number, String deviceId) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeString(number);
            _hidl_request.writeString(deviceId);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(14, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void cancelDeviceSwitch(int serial) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(15, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void setResponseFunctionsRcs(IRcsRadioResponse radioResponse, IRcsRadioIndication radioIndication) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            IHwBinder iHwBinder = null;
            _hidl_request.writeStrongBinder(radioResponse == null ? null : radioResponse.asBinder());
            if (radioIndication != null) {
                iHwBinder = radioIndication.asBinder();
            }
            _hidl_request.writeStrongBinder(iHwBinder);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(16, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void switchRcsRoiStatus(int serial, boolean status) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeBool(status);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(17, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void updateRcsCapabilities(int serial, int mode, String featureTags) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeInt32(mode);
            _hidl_request.writeString(featureTags);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(18, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void updateRcsSessionInfo(int serial, int count) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            _hidl_request.writeInt32(count);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(19, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp
        public void exitSCBM(int serial) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioOp.kInterfaceName);
            _hidl_request.writeInt32(serial);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(20, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public ArrayList<String> interfaceChain() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256067662, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
                return _hidl_reply.readStringVector();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public void debug(NativeHandle fd, ArrayList<String> options) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            _hidl_request.writeNativeHandle(fd);
            _hidl_request.writeStringVector(options);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256131655, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public String interfaceDescriptor() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256136003, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
                return _hidl_reply.readString();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public ArrayList<byte[]> getHashChain() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256398152, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
                ArrayList<byte[]> _hidl_out_hashchain = new ArrayList<>();
                HwBlob _hidl_blob = _hidl_reply.readBuffer(16);
                int _hidl_vec_size = _hidl_blob.getInt32(8);
                HwBlob childBlob = _hidl_reply.readEmbeddedBuffer((long) (_hidl_vec_size * 32), _hidl_blob.handle(), 0, true);
                _hidl_out_hashchain.clear();
                for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
                    byte[] _hidl_vec_element = new byte[32];
                    childBlob.copyToInt8Array((long) (_hidl_index_0 * 32), _hidl_vec_element, 32);
                    _hidl_out_hashchain.add(_hidl_vec_element);
                }
                return _hidl_out_hashchain;
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public void setHALInstrumentation() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256462420, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public boolean linkToDeath(IHwBinder.DeathRecipient recipient, long cookie) throws RemoteException {
            return this.mRemote.linkToDeath(recipient, cookie);
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public void ping() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(256921159, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public DebugInfo getDebugInfo() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(257049926, _hidl_request, _hidl_reply, 0);
                _hidl_reply.verifySuccess();
                _hidl_request.releaseTemporaryStorage();
                DebugInfo _hidl_out_info = new DebugInfo();
                _hidl_out_info.readFromParcel(_hidl_reply);
                return _hidl_out_info;
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public void notifySyspropsChanged() throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IBase.kInterfaceName);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(257120595, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public boolean unlinkToDeath(IHwBinder.DeathRecipient recipient) throws RemoteException {
            return this.mRemote.unlinkToDeath(recipient);
        }
    }

    public static abstract class Stub extends HwBinder implements IRadioOp {
        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public IHwBinder asBinder() {
            return this;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final ArrayList<String> interfaceChain() {
            return new ArrayList<>(Arrays.asList(IRadioOp.kInterfaceName, IBase.kInterfaceName));
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public void debug(NativeHandle fd, ArrayList<String> arrayList) {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final String interfaceDescriptor() {
            return IRadioOp.kInterfaceName;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final ArrayList<byte[]> getHashChain() {
            return new ArrayList<>(Arrays.asList(new byte[]{120, -22, 45, 66, 28, 89, 51, Byte.MAX_VALUE, 43, -40, 86, -5, 91, 80, -70, -89, -110, 44, -111, -71, 65, -82, 32, 57, 1, -103, 113, 90, -11, 100, 48, -16}, new byte[]{-20, Byte.MAX_VALUE, -41, -98, -48, 45, -6, -123, -68, 73, -108, 38, -83, -82, 62, -66, 35, -17, 5, 36, -13, -51, 105, 87, 19, -109, 36, -72, 59, 24, -54, 76}));
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final void setHALInstrumentation() {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final boolean linkToDeath(IHwBinder.DeathRecipient recipient, long cookie) {
            return true;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final void ping() {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final DebugInfo getDebugInfo() {
            DebugInfo info = new DebugInfo();
            info.pid = HidlSupport.getPidIfSharable();
            info.ptr = 0;
            info.arch = 0;
            return info;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final void notifySyspropsChanged() {
            HwBinder.enableInstrumentation();
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioOp, android.hidl.base.V1_0.IBase
        public final boolean unlinkToDeath(IHwBinder.DeathRecipient recipient) {
            return true;
        }

        public IHwInterface queryLocalInterface(String descriptor) {
            if (IRadioOp.kInterfaceName.equals(descriptor)) {
                return this;
            }
            return null;
        }

        public void registerAsService(String serviceName) throws RemoteException {
            registerService(serviceName);
        }

        public String toString() {
            return interfaceDescriptor() + "@Stub";
        }

        public void onTransact(int _hidl_code, HwParcel _hidl_request, HwParcel _hidl_reply, int _hidl_flags) throws RemoteException {
            switch (_hidl_code) {
                case 1:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    responseAcknowledgement();
                    return;
                case 2:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setResponseFunctions(IRadioResponseOp.asInterface(_hidl_request.readStrongBinder()), IRadioIndicationOp.asInterface(_hidl_request.readStrongBinder()));
                    _hidl_reply.writeStatus(0);
                    _hidl_reply.send();
                    return;
                case 3:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setResponseFunctionsIms(IImsRadioResponseOp.asInterface(_hidl_request.readStrongBinder()), IImsRadioIndicationOp.asInterface(_hidl_request.readStrongBinder()));
                    return;
                case 4:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setIncomingVirtualLine(_hidl_request.readInt32(), _hidl_request.readString(), _hidl_request.readString());
                    return;
                case 5:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setRxTestConfig(_hidl_request.readInt32(), _hidl_request.readInt32());
                    return;
                case 6:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    getRxTestResult(_hidl_request.readInt32(), _hidl_request.readInt32());
                    return;
                case 7:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    int serial = _hidl_request.readInt32();
                    DialFrom dialInfo = new DialFrom();
                    dialInfo.readFromParcel(_hidl_request);
                    dialFrom(serial, dialInfo);
                    return;
                case 8:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    sendUssiFrom(_hidl_request.readInt32(), _hidl_request.readString(), _hidl_request.readInt32(), _hidl_request.readString());
                    return;
                case 9:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    cancelUssiFrom(_hidl_request.readInt32(), _hidl_request.readString());
                    return;
                case 10:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setEmergencyCallConfig(_hidl_request.readInt32(), _hidl_request.readInt32(), _hidl_request.readBool());
                    return;
                case 11:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setDisable2G(_hidl_request.readInt32(), _hidl_request.readBool());
                    return;
                case 12:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    getDisable2G(_hidl_request.readInt32());
                    return;
                case 13:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    int serial2 = _hidl_request.readInt32();
                    RsuRequestInfo rri = new RsuRequestInfo();
                    rri.readFromParcel(_hidl_request);
                    sendRsuRequest(serial2, rri);
                    return;
                case 14:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    deviceSwitch(_hidl_request.readInt32(), _hidl_request.readString(), _hidl_request.readString());
                    return;
                case 15:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    cancelDeviceSwitch(_hidl_request.readInt32());
                    return;
                case 16:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    setResponseFunctionsRcs(IRcsRadioResponse.asInterface(_hidl_request.readStrongBinder()), IRcsRadioIndication.asInterface(_hidl_request.readStrongBinder()));
                    return;
                case 17:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    switchRcsRoiStatus(_hidl_request.readInt32(), _hidl_request.readBool());
                    return;
                case 18:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    updateRcsCapabilities(_hidl_request.readInt32(), _hidl_request.readInt32(), _hidl_request.readString());
                    return;
                case 19:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    updateRcsSessionInfo(_hidl_request.readInt32(), _hidl_request.readInt32());
                    return;
                case 20:
                    _hidl_request.enforceInterface(IRadioOp.kInterfaceName);
                    exitSCBM(_hidl_request.readInt32());
                    return;
                default:
                    switch (_hidl_code) {
                        case 256067662:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            ArrayList<String> _hidl_out_descriptors = interfaceChain();
                            _hidl_reply.writeStatus(0);
                            _hidl_reply.writeStringVector(_hidl_out_descriptors);
                            _hidl_reply.send();
                            return;
                        case 256131655:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            debug(_hidl_request.readNativeHandle(), _hidl_request.readStringVector());
                            _hidl_reply.writeStatus(0);
                            _hidl_reply.send();
                            return;
                        case 256136003:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            String _hidl_out_descriptor = interfaceDescriptor();
                            _hidl_reply.writeStatus(0);
                            _hidl_reply.writeString(_hidl_out_descriptor);
                            _hidl_reply.send();
                            return;
                        case 256398152:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            ArrayList<byte[]> _hidl_out_hashchain = getHashChain();
                            _hidl_reply.writeStatus(0);
                            HwBlob _hidl_blob = new HwBlob(16);
                            int _hidl_vec_size = _hidl_out_hashchain.size();
                            _hidl_blob.putInt32(8, _hidl_vec_size);
                            _hidl_blob.putBool(12, false);
                            HwBlob childBlob = new HwBlob(_hidl_vec_size * 32);
                            for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
                                long _hidl_array_offset_1 = (long) (_hidl_index_0 * 32);
                                byte[] _hidl_array_item_1 = _hidl_out_hashchain.get(_hidl_index_0);
                                if (_hidl_array_item_1 == null || _hidl_array_item_1.length != 32) {
                                    throw new IllegalArgumentException("Array element is not of the expected length");
                                }
                                childBlob.putInt8Array(_hidl_array_offset_1, _hidl_array_item_1);
                            }
                            _hidl_blob.putBlob(0, childBlob);
                            _hidl_reply.writeBuffer(_hidl_blob);
                            _hidl_reply.send();
                            return;
                        case 256462420:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            setHALInstrumentation();
                            return;
                        case 256921159:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            ping();
                            _hidl_reply.writeStatus(0);
                            _hidl_reply.send();
                            return;
                        case 257049926:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            DebugInfo _hidl_out_info = getDebugInfo();
                            _hidl_reply.writeStatus(0);
                            _hidl_out_info.writeToParcel(_hidl_reply);
                            _hidl_reply.send();
                            return;
                        case 257120595:
                            _hidl_request.enforceInterface(IBase.kInterfaceName);
                            notifySyspropsChanged();
                            return;
                        default:
                            return;
                    }
            }
        }
    }
}

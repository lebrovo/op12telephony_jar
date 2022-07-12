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

public interface IRadioIndicationOp extends IBase {
    public static final String kInterfaceName = "vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp";

    @Override // android.hidl.base.V1_0.IBase
    IHwBinder asBinder();

    @Override // android.hidl.base.V1_0.IBase
    void debug(NativeHandle nativeHandle, ArrayList<String> arrayList) throws RemoteException;

    void enterSCBMInd(int i) throws RemoteException;

    void exitSCBMInd(int i) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    DebugInfo getDebugInfo() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    ArrayList<byte[]> getHashChain() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    ArrayList<String> interfaceChain() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    String interfaceDescriptor() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    boolean linkToDeath(IHwBinder.DeathRecipient deathRecipient, long j) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void notifySyspropsChanged() throws RemoteException;

    void onRsuEvent(int i, int i2, String str) throws RemoteException;

    void onSimMeLockEvent(int i, int i2) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void ping() throws RemoteException;

    void responseModulationInfoInd(int i, ArrayList<Integer> arrayList) throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    void setHALInstrumentation() throws RemoteException;

    @Override // android.hidl.base.V1_0.IBase
    boolean unlinkToDeath(IHwBinder.DeathRecipient deathRecipient) throws RemoteException;

    static default IRadioIndicationOp asInterface(IHwBinder binder) {
        if (binder == null) {
            return null;
        }
        IHwInterface iface = binder.queryLocalInterface(kInterfaceName);
        if (iface != null && (iface instanceof IRadioIndicationOp)) {
            return (IRadioIndicationOp) iface;
        }
        IRadioIndicationOp proxy = new Proxy(binder);
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

    static default IRadioIndicationOp castFrom(IHwInterface iface) {
        if (iface == null) {
            return null;
        }
        return asInterface(iface.asBinder());
    }

    static default IRadioIndicationOp getService(String serviceName, boolean retry) throws RemoteException {
        return asInterface(HwBinder.getService(kInterfaceName, serviceName, retry));
    }

    static default IRadioIndicationOp getService(boolean retry) throws RemoteException {
        return getService("default", retry);
    }

    static default IRadioIndicationOp getService(String serviceName) throws RemoteException {
        return asInterface(HwBinder.getService(kInterfaceName, serviceName));
    }

    static default IRadioIndicationOp getService() throws RemoteException {
        return getService("default");
    }

    public static final class Proxy implements IRadioIndicationOp {
        private IHwBinder mRemote;

        public Proxy(IHwBinder remote) {
            Objects.requireNonNull(remote);
            this.mRemote = remote;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public IHwBinder asBinder() {
            return this.mRemote;
        }

        public String toString() {
            try {
                return interfaceDescriptor() + "@Proxy";
            } catch (RemoteException e) {
                return "[class or subclass of vendor.mediatek.hardware.radio_op@3.0::IRadioIndicationOp]@Proxy";
            }
        }

        public final boolean equals(Object other) {
            return HidlSupport.interfacesEqual(this, other);
        }

        public final int hashCode() {
            return asBinder().hashCode();
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp
        public void onSimMeLockEvent(int type, int eventId) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioIndicationOp.kInterfaceName);
            _hidl_request.writeInt32(type);
            _hidl_request.writeInt32(eventId);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(1, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp
        public void onRsuEvent(int type, int eventId, String eventString) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioIndicationOp.kInterfaceName);
            _hidl_request.writeInt32(type);
            _hidl_request.writeInt32(eventId);
            _hidl_request.writeString(eventString);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(2, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp
        public void responseModulationInfoInd(int type, ArrayList<Integer> modulation) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioIndicationOp.kInterfaceName);
            _hidl_request.writeInt32(type);
            _hidl_request.writeInt32Vector(modulation);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(3, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp
        public void exitSCBMInd(int type) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioIndicationOp.kInterfaceName);
            _hidl_request.writeInt32(type);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(4, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp
        public void enterSCBMInd(int type) throws RemoteException {
            HwParcel _hidl_request = new HwParcel();
            _hidl_request.writeInterfaceToken(IRadioIndicationOp.kInterfaceName);
            _hidl_request.writeInt32(type);
            HwParcel _hidl_reply = new HwParcel();
            try {
                this.mRemote.transact(5, _hidl_request, _hidl_reply, 1);
                _hidl_request.releaseTemporaryStorage();
            } finally {
                _hidl_reply.release();
            }
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public boolean linkToDeath(IHwBinder.DeathRecipient recipient, long cookie) throws RemoteException {
            return this.mRemote.linkToDeath(recipient, cookie);
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
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

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public boolean unlinkToDeath(IHwBinder.DeathRecipient recipient) throws RemoteException {
            return this.mRemote.unlinkToDeath(recipient);
        }
    }

    public static abstract class Stub extends HwBinder implements IRadioIndicationOp {
        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public IHwBinder asBinder() {
            return this;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final ArrayList<String> interfaceChain() {
            return new ArrayList<>(Arrays.asList(IRadioIndicationOp.kInterfaceName, IBase.kInterfaceName));
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public void debug(NativeHandle fd, ArrayList<String> arrayList) {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final String interfaceDescriptor() {
            return IRadioIndicationOp.kInterfaceName;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final ArrayList<byte[]> getHashChain() {
            return new ArrayList<>(Arrays.asList(new byte[]{-15, 80, -99, 68, 17, 89, 58, 15, 103, 109, 70, -63, -63, -2, -97, 63, 93, -17, -111, 107, -88, -49, 13, -65, 2, 93, -20, -71, 2, 8, 87, 9}, new byte[]{-20, Byte.MAX_VALUE, -41, -98, -48, 45, -6, -123, -68, 73, -108, 38, -83, -82, 62, -66, 35, -17, 5, 36, -13, -51, 105, 87, 19, -109, 36, -72, 59, 24, -54, 76}));
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final void setHALInstrumentation() {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final boolean linkToDeath(IHwBinder.DeathRecipient recipient, long cookie) {
            return true;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final void ping() {
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final DebugInfo getDebugInfo() {
            DebugInfo info = new DebugInfo();
            info.pid = HidlSupport.getPidIfSharable();
            info.ptr = 0;
            info.arch = 0;
            return info;
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final void notifySyspropsChanged() {
            HwBinder.enableInstrumentation();
        }

        @Override // vendor.mediatek.hardware.radio_op.V3_0.IRadioIndicationOp, android.hidl.base.V1_0.IBase
        public final boolean unlinkToDeath(IHwBinder.DeathRecipient recipient) {
            return true;
        }

        public IHwInterface queryLocalInterface(String descriptor) {
            if (IRadioIndicationOp.kInterfaceName.equals(descriptor)) {
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
            if (_hidl_code == 1) {
                _hidl_request.enforceInterface(IRadioIndicationOp.kInterfaceName);
                onSimMeLockEvent(_hidl_request.readInt32(), _hidl_request.readInt32());
            } else if (_hidl_code == 2) {
                _hidl_request.enforceInterface(IRadioIndicationOp.kInterfaceName);
                onRsuEvent(_hidl_request.readInt32(), _hidl_request.readInt32(), _hidl_request.readString());
            } else if (_hidl_code == 3) {
                _hidl_request.enforceInterface(IRadioIndicationOp.kInterfaceName);
                responseModulationInfoInd(_hidl_request.readInt32(), _hidl_request.readInt32Vector());
            } else if (_hidl_code == 4) {
                _hidl_request.enforceInterface(IRadioIndicationOp.kInterfaceName);
                exitSCBMInd(_hidl_request.readInt32());
            } else if (_hidl_code != 5) {
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
            } else {
                _hidl_request.enforceInterface(IRadioIndicationOp.kInterfaceName);
                enterSCBMInd(_hidl_request.readInt32());
            }
        }
    }
}

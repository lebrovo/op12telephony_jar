package android.hardware.radio.V1_0;

import android.os.HidlSupport;
import android.os.HwBlob;
import android.os.HwParcel;
import java.util.ArrayList;
import java.util.Objects;

public final class SetupDataCallResult {
    public int active = 0;
    public String addresses = new String();
    public int cid = 0;
    public String dnses = new String();
    public String gateways = new String();
    public String ifname = new String();
    public int mtu = 0;
    public String pcscf = new String();
    public int status = 0;
    public int suggestedRetryTime = 0;
    public String type = new String();

    public final boolean equals(Object otherObject) {
        if (this == otherObject) {
            return true;
        }
        if (otherObject == null || otherObject.getClass() != SetupDataCallResult.class) {
            return false;
        }
        SetupDataCallResult other = (SetupDataCallResult) otherObject;
        if (this.status == other.status && this.suggestedRetryTime == other.suggestedRetryTime && this.cid == other.cid && this.active == other.active && HidlSupport.deepEquals(this.type, other.type) && HidlSupport.deepEquals(this.ifname, other.ifname) && HidlSupport.deepEquals(this.addresses, other.addresses) && HidlSupport.deepEquals(this.dnses, other.dnses) && HidlSupport.deepEquals(this.gateways, other.gateways) && HidlSupport.deepEquals(this.pcscf, other.pcscf) && this.mtu == other.mtu) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.status))), Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.suggestedRetryTime))), Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.cid))), Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.active))), Integer.valueOf(HidlSupport.deepHashCode(this.type)), Integer.valueOf(HidlSupport.deepHashCode(this.ifname)), Integer.valueOf(HidlSupport.deepHashCode(this.addresses)), Integer.valueOf(HidlSupport.deepHashCode(this.dnses)), Integer.valueOf(HidlSupport.deepHashCode(this.gateways)), Integer.valueOf(HidlSupport.deepHashCode(this.pcscf)), Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.mtu))));
    }

    public final String toString() {
        return "{" + ".status = " + DataCallFailCause.toString(this.status) + ", .suggestedRetryTime = " + this.suggestedRetryTime + ", .cid = " + this.cid + ", .active = " + this.active + ", .type = " + this.type + ", .ifname = " + this.ifname + ", .addresses = " + this.addresses + ", .dnses = " + this.dnses + ", .gateways = " + this.gateways + ", .pcscf = " + this.pcscf + ", .mtu = " + this.mtu + "}";
    }

    public final void readFromParcel(HwParcel parcel) {
        readEmbeddedFromParcel(parcel, parcel.readBuffer(120), 0);
    }

    public static final ArrayList<SetupDataCallResult> readVectorFromParcel(HwParcel parcel) {
        ArrayList<SetupDataCallResult> _hidl_vec = new ArrayList<>();
        HwBlob _hidl_blob = parcel.readBuffer(16);
        int _hidl_vec_size = _hidl_blob.getInt32(8);
        HwBlob childBlob = parcel.readEmbeddedBuffer((long) (_hidl_vec_size * DataCallFailCause.IFACE_AND_POL_FAMILY_MISMATCH), _hidl_blob.handle(), 0, true);
        _hidl_vec.clear();
        for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
            SetupDataCallResult _hidl_vec_element = new SetupDataCallResult();
            _hidl_vec_element.readEmbeddedFromParcel(parcel, childBlob, (long) (_hidl_index_0 * DataCallFailCause.IFACE_AND_POL_FAMILY_MISMATCH));
            _hidl_vec.add(_hidl_vec_element);
        }
        return _hidl_vec;
    }

    public final void readEmbeddedFromParcel(HwParcel parcel, HwBlob _hidl_blob, long _hidl_offset) {
        this.status = _hidl_blob.getInt32(_hidl_offset + 0);
        this.suggestedRetryTime = _hidl_blob.getInt32(_hidl_offset + 4);
        this.cid = _hidl_blob.getInt32(_hidl_offset + 8);
        this.active = _hidl_blob.getInt32(_hidl_offset + 12);
        String string = _hidl_blob.getString(_hidl_offset + 16);
        this.type = string;
        parcel.readEmbeddedBuffer((long) (string.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 16 + 0, false);
        String string2 = _hidl_blob.getString(_hidl_offset + 32);
        this.ifname = string2;
        parcel.readEmbeddedBuffer((long) (string2.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 32 + 0, false);
        String string3 = _hidl_blob.getString(_hidl_offset + 48);
        this.addresses = string3;
        parcel.readEmbeddedBuffer((long) (string3.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 48 + 0, false);
        String string4 = _hidl_blob.getString(_hidl_offset + 64);
        this.dnses = string4;
        parcel.readEmbeddedBuffer((long) (string4.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 64 + 0, false);
        String string5 = _hidl_blob.getString(_hidl_offset + 80);
        this.gateways = string5;
        parcel.readEmbeddedBuffer((long) (string5.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 80 + 0, false);
        String string6 = _hidl_blob.getString(_hidl_offset + 96);
        this.pcscf = string6;
        parcel.readEmbeddedBuffer((long) (string6.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 96 + 0, false);
        this.mtu = _hidl_blob.getInt32(_hidl_offset + 112);
    }

    public final void writeToParcel(HwParcel parcel) {
        HwBlob _hidl_blob = new HwBlob((int) DataCallFailCause.IFACE_AND_POL_FAMILY_MISMATCH);
        writeEmbeddedToBlob(_hidl_blob, 0);
        parcel.writeBuffer(_hidl_blob);
    }

    public static final void writeVectorToParcel(HwParcel parcel, ArrayList<SetupDataCallResult> _hidl_vec) {
        HwBlob _hidl_blob = new HwBlob(16);
        int _hidl_vec_size = _hidl_vec.size();
        _hidl_blob.putInt32(8, _hidl_vec_size);
        _hidl_blob.putBool(12, false);
        HwBlob childBlob = new HwBlob(_hidl_vec_size * DataCallFailCause.IFACE_AND_POL_FAMILY_MISMATCH);
        for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
            _hidl_vec.get(_hidl_index_0).writeEmbeddedToBlob(childBlob, (long) (_hidl_index_0 * DataCallFailCause.IFACE_AND_POL_FAMILY_MISMATCH));
        }
        _hidl_blob.putBlob(0, childBlob);
        parcel.writeBuffer(_hidl_blob);
    }

    public final void writeEmbeddedToBlob(HwBlob _hidl_blob, long _hidl_offset) {
        _hidl_blob.putInt32(0 + _hidl_offset, this.status);
        _hidl_blob.putInt32(4 + _hidl_offset, this.suggestedRetryTime);
        _hidl_blob.putInt32(8 + _hidl_offset, this.cid);
        _hidl_blob.putInt32(12 + _hidl_offset, this.active);
        _hidl_blob.putString(16 + _hidl_offset, this.type);
        _hidl_blob.putString(32 + _hidl_offset, this.ifname);
        _hidl_blob.putString(48 + _hidl_offset, this.addresses);
        _hidl_blob.putString(64 + _hidl_offset, this.dnses);
        _hidl_blob.putString(80 + _hidl_offset, this.gateways);
        _hidl_blob.putString(96 + _hidl_offset, this.pcscf);
        _hidl_blob.putInt32(112 + _hidl_offset, this.mtu);
    }
}

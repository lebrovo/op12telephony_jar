package android.hardware.radio.V1_0;

import android.os.HidlSupport;
import android.os.HwBlob;
import android.os.HwParcel;
import java.util.ArrayList;
import java.util.Objects;

public final class SendSmsResult {
    public String ackPDU = new String();
    public int errorCode = 0;
    public int messageRef = 0;

    public final boolean equals(Object otherObject) {
        if (this == otherObject) {
            return true;
        }
        if (otherObject == null || otherObject.getClass() != SendSmsResult.class) {
            return false;
        }
        SendSmsResult other = (SendSmsResult) otherObject;
        if (this.messageRef == other.messageRef && HidlSupport.deepEquals(this.ackPDU, other.ackPDU) && this.errorCode == other.errorCode) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.messageRef))), Integer.valueOf(HidlSupport.deepHashCode(this.ackPDU)), Integer.valueOf(HidlSupport.deepHashCode(Integer.valueOf(this.errorCode))));
    }

    public final String toString() {
        return "{" + ".messageRef = " + this.messageRef + ", .ackPDU = " + this.ackPDU + ", .errorCode = " + this.errorCode + "}";
    }

    public final void readFromParcel(HwParcel parcel) {
        readEmbeddedFromParcel(parcel, parcel.readBuffer(32), 0);
    }

    public static final ArrayList<SendSmsResult> readVectorFromParcel(HwParcel parcel) {
        ArrayList<SendSmsResult> _hidl_vec = new ArrayList<>();
        HwBlob _hidl_blob = parcel.readBuffer(16);
        int _hidl_vec_size = _hidl_blob.getInt32(8);
        HwBlob childBlob = parcel.readEmbeddedBuffer((long) (_hidl_vec_size * 32), _hidl_blob.handle(), 0, true);
        _hidl_vec.clear();
        for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
            SendSmsResult _hidl_vec_element = new SendSmsResult();
            _hidl_vec_element.readEmbeddedFromParcel(parcel, childBlob, (long) (_hidl_index_0 * 32));
            _hidl_vec.add(_hidl_vec_element);
        }
        return _hidl_vec;
    }

    public final void readEmbeddedFromParcel(HwParcel parcel, HwBlob _hidl_blob, long _hidl_offset) {
        this.messageRef = _hidl_blob.getInt32(_hidl_offset + 0);
        String string = _hidl_blob.getString(_hidl_offset + 8);
        this.ackPDU = string;
        parcel.readEmbeddedBuffer((long) (string.getBytes().length + 1), _hidl_blob.handle(), _hidl_offset + 8 + 0, false);
        this.errorCode = _hidl_blob.getInt32(_hidl_offset + 24);
    }

    public final void writeToParcel(HwParcel parcel) {
        HwBlob _hidl_blob = new HwBlob(32);
        writeEmbeddedToBlob(_hidl_blob, 0);
        parcel.writeBuffer(_hidl_blob);
    }

    public static final void writeVectorToParcel(HwParcel parcel, ArrayList<SendSmsResult> _hidl_vec) {
        HwBlob _hidl_blob = new HwBlob(16);
        int _hidl_vec_size = _hidl_vec.size();
        _hidl_blob.putInt32(8, _hidl_vec_size);
        _hidl_blob.putBool(12, false);
        HwBlob childBlob = new HwBlob(_hidl_vec_size * 32);
        for (int _hidl_index_0 = 0; _hidl_index_0 < _hidl_vec_size; _hidl_index_0++) {
            _hidl_vec.get(_hidl_index_0).writeEmbeddedToBlob(childBlob, (long) (_hidl_index_0 * 32));
        }
        _hidl_blob.putBlob(0, childBlob);
        parcel.writeBuffer(_hidl_blob);
    }

    public final void writeEmbeddedToBlob(HwBlob _hidl_blob, long _hidl_offset) {
        _hidl_blob.putInt32(0 + _hidl_offset, this.messageRef);
        _hidl_blob.putString(8 + _hidl_offset, this.ackPDU);
        _hidl_blob.putInt32(24 + _hidl_offset, this.errorCode);
    }
}

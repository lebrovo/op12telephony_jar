package com.mediatek.op12.telephony.selfactivation;

public class SaRadioEnabledCause {
    static final int CAUSE_ADD_DATA_SERVICE = 3;
    static final int CAUSE_EMERGENCY_CALL = 2;
    static final int CAUSE_NONE = 0;
    static final int CAUSE_NORMAL_CALL = 1;
    static final int CAUSE_SIM_CHANGED = 4;
    static final int MAX_CAUSE = 4;
    static final int MIN_CAUSE = 0;
    private int mRadioEnabledCause = 0;

    public SaRadioEnabledCause setCause(int cause) {
        enforceValidCause(cause);
        this.mRadioEnabledCause = cause;
        return this;
    }

    public SaRadioEnabledCause addCause(int cause) {
        enforceValidCause(cause);
        this.mRadioEnabledCause |= 1 << cause;
        return this;
    }

    public SaRadioEnabledCause removeCause(int cause) {
        enforceValidCause(cause);
        this.mRadioEnabledCause &= ~(1 << cause);
        return this;
    }

    public boolean hasCause(int cause) {
        enforceValidCause(cause);
        return (this.mRadioEnabledCause & (1 << cause)) != 0;
    }

    private void enforceValidCause(int cause) {
        if (cause < 0 || cause > 4) {
            throw new IllegalArgumentException("Invalid radio enabled cause: " + cause);
        }
    }

    public int[] getRadioEnabledCauses() {
        return enumerateBits((long) this.mRadioEnabledCause);
    }

    private int[] enumerateBits(long val) {
        int[] result = new int[Long.bitCount(val)];
        int index = 0;
        int resource = 0;
        while (val > 0) {
            if ((val & 1) == 1) {
                result[index] = resource;
                index++;
            }
            val >>= 1;
            resource++;
        }
        return result;
    }

    public String toString() {
        if (this.mRadioEnabledCause == 0) {
            return "RadioEnabledCause: CAUSE_NONE";
        }
        int[] types = getRadioEnabledCauses();
        String causes = types.length > 0 ? "RadioEnabledCause: " : "";
        int i = 0;
        while (i < types.length) {
            int i2 = types[i];
            if (i2 == 1) {
                causes = causes + "NORMAL_CALL";
            } else if (i2 == 2) {
                causes = causes + "EMERGENCY_CALL";
            } else if (i2 == 3) {
                causes = causes + "ADD_DATA_SERVICE";
            } else if (i2 == 4) {
                causes = causes + "SIM_CHANGED";
            }
            i++;
            if (i < types.length) {
                causes = causes + "&";
            }
        }
        return causes;
    }
}

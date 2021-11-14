package com.chauthai.swipereveallayoutdemo;

import android.text.SpannableStringBuilder;

import javax.security.auth.Destroyable;

public class ReverseSpannableStringBuilder extends SpannableStringBuilder implements Destroyable {

    @Override
    public String toString() {
        int len = length();
        char[] buf = new char[len];
        char[] value = new char[len];

        getChars(0, len, buf, 0);
        for (int i = 0; i < len; ++i) {
            value[len - i - 1] = buf[i];
            buf[i] = '0';
        }

        return new String(value);
    }

    @Override
    public void destroy() {
        if (isDestroyed()) {
            return;
        }
        clear();
        System.gc();
    }

    @Override
    public boolean isDestroyed() {
        return length() == 0;
    }
}

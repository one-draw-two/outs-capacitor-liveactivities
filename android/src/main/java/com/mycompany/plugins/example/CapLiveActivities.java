package com.mycompany.plugins.example;

import android.util.Log;

public class CapLiveActivities {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }

    public boolean startLiveActivity(String testString) {
        Log.w("CapLiveActivities", "Live Activities are not supported on Android");
        if (testString != null) {
            Log.i("CapLiveActivities", "Test string: " + testString);
        }
        return false;
    }
}

package com.mycompany.plugins.example;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CapLiveActivities")
public class CapLiveActivitiesPlugin extends Plugin {

    private CapLiveActivities implementation = new CapLiveActivities();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void startLiveActivity(PluginCall call) {
        String testString = call.getString("testString");
        
        boolean result = implementation.startLiveActivity(testString);
        
        JSObject ret = new JSObject();
        ret.put("started", result);
        call.resolve(ret);
    }
}

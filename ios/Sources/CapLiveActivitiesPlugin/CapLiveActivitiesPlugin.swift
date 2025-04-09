import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapLiveActivitiesPlugin)
public class CapLiveActivitiesPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapLiveActivitiesPlugin"
    public let jsName = "CapLiveActivities"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "startLiveActivity", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CapLiveActivities()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func startLiveActivity(_ call: CAPPluginCall) {
        guard let activityId = call.getString("activityId") else {
            call.reject("Activity ID is required")
            return
        }
        
        guard let data = call.getObject("data") else {
            call.reject("Activity data is required")
            return
        }
        
        do {
            let started = try implementation.startLiveActivity(activityId: activityId, data: data)
            call.resolve(["started": started])
        } catch {
            call.reject("Failed to start Live Activity: \(error.localizedDescription)")
        }
    }
}

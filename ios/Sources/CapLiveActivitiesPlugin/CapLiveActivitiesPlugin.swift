import Capacitor
import Foundation

/// Please read the Capacitor iOS Plugin Development Guide
/// here: https://capacitorjs.com/docs/plugins/ios
@objc(CapLiveActivitiesPlugin)
public class CapLiveActivitiesPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapLiveActivitiesPlugin"
    public let jsName = "CapLiveActivities"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "startLiveActivity", returnType: CAPPluginReturnPromise),
    ]
    private let implementation = CapLiveActivities()

    override public func load() {
        super.load()
        for notificationName in ["StartTokenReceived", "UpdateTokenReceived"] {
            NotificationCenter.default.addObserver(
                self, selector: #selector(handleTokenReceived(_:)),
                name: Notification.Name(notificationName), object: nil)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve(["value": implementation.echo(value)])
    }

    @objc private func handleTokenReceived(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let token = userInfo["token"] as? String
        else {
            return
        }

        // Create a mutable dictionary to pass all userInfo to JavaScript
        var eventData: [String: Any] = ["token": token]

        // Add any other fields from userInfo that might be present
        if let activityType = userInfo["activityType"] as? String {
            eventData["activityType"] = activityType
        }

        if let instanceId = userInfo["instanceId"] as? String {
            eventData["instanceId"] = instanceId
        }

        if let timestamp = userInfo["timestamp"] as? Date {
            eventData["timestamp"] = Int(timestamp.timeIntervalSince1970 * 1000)
        }

        // Add any other fields that might be relevant

        self.notifyListeners(notification.name.rawValue, data: eventData)
    }

    @objc func startLiveActivity(_ call: CAPPluginCall) {
        let testString = call.getString("testString")
        let started = implementation.startLiveActivity(testString: testString)
        call.resolve(["started": started])
    }
}

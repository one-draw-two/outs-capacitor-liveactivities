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
        // Token notifications
        for notificationName in ["StartTokenReceived", "UpdateTokenReceived"] {
            NotificationCenter.default.addObserver(
                self, selector: #selector(handleTokenReceived(_:)),
                name: Notification.Name(notificationName), object: nil)
        }

        // Console message notifications (separate handler)
        NotificationCenter.default.addObserver(
            self, selector: #selector(handleConsoleMessage(_:)),
            name: Notification.Name("ConsoleMessageReceived"), object: nil)
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

        // Create a dictionary to pass all userInfo to JavaScript
        var eventData: [String: Any] = [:]

        // Copy all values from userInfo to eventData
        for (key, value) in userInfo {
            if let key = key as? String {
                // Handle Date objects specially by converting to milliseconds timestamp
                if let dateValue = value as? Date {
                    eventData[key] = Int(dateValue.timeIntervalSince1970 * 1000)
                } else {
                    eventData[key] = value
                }
            }
        }

        self.notifyListeners(notification.name.rawValue, data: eventData)
    }

    @objc private func handleConsoleMessage(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }

        // Create a dictionary to pass all userInfo to JavaScript
        var eventData: [String: Any] = [:]

        // Copy all values from userInfo to eventData
        for (key, value) in userInfo {
            if let key = key as? String {
                // Handle Date objects specially by converting to milliseconds timestamp
                if let dateValue = value as? Date {
                    eventData[key] = Int(dateValue.timeIntervalSince1970 * 1000)
                } else {
                    eventData[key] = value
                }
            }
        }

        self.notifyListeners(notification.name.rawValue, data: eventData)
    }

    @objc func startLiveActivity(_ call: CAPPluginCall) {
        let testString = call.getString("testString")
        let started = implementation.startLiveActivity(testString: testString)
        call.resolve(["started": started])
    }
}

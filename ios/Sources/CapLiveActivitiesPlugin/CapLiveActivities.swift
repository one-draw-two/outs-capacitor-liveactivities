import Foundation

@objc public class CapLiveActivities: NSObject {
    public static var liveActivityDelegate: LiveActivityDelegate?

    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    public func startLiveActivity(testString: String? = nil) -> Bool {
        if #available(iOS 16.1, *) {
            if let test = testString {
                print("Test string received:", test)
            }
            // CapLiveActivities.liveActivityDelegate?.monitorPushToStartToken()
            // CapLiveActivities.liveActivityDelegate?.monitorNewActivities()
            CapLiveActivities.liveActivityDelegate?.initialize()
            return true
        } else {
            print("Live Activities require iOS 16.1 or later")
            return false
        }
    }
}

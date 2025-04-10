import Foundation

@objc public class CapLiveActivities: NSObject {
    public static var liveActivityDelegate: LiveActivityDelegate?
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    public func startLiveActivity(activityId: String, data: [String: Any]) throws -> Bool {
        if #available(iOS 16.1, *) {

            CapLiveActivities.liveActivityDelegate?.monitorPushToStartToken()
            CapLiveActivities.liveActivityDelegate?.monitorNewActivities()

            return true
        } else {
            throw NSError(domain: "com.capacitor.liveactivities",
                         code: -1,
                         userInfo: [NSLocalizedDescriptionKey: "Live Activities require iOS 16.1 or later"])
        }
    }
}

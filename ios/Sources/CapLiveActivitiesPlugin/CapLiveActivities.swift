import Foundation

@objc public class CapLiveActivities: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    public func startLiveActivity(activityId: String, data: [String: Any]) throws -> Bool {
        if #available(iOS 16.1, *) {
            // Your Live Activity implementation here
            // This is a basic example - you'll need to adapt it to your specific Activity type
            // and data structure
            print("Happily here bro")
            return true
        } else {
            throw NSError(domain: "com.capacitor.liveactivities",
                         code: -1,
                         userInfo: [NSLocalizedDescriptionKey: "Live Activities require iOS 16.1 or later"])
        }
    }
}
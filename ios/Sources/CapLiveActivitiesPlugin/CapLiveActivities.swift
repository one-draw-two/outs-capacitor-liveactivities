import Foundation

@objc public class CapLiveActivities: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}

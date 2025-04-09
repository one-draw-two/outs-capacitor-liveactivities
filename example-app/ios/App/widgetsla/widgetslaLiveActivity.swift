//
//  widgetslaLiveActivity.swift
//  widgetsla
//
//  Created by Kemal Yalcinkaya on 09.04.25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct widgetslaAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct widgetslaLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: widgetslaAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension widgetslaAttributes {
    fileprivate static var preview: widgetslaAttributes {
        widgetslaAttributes(name: "World")
    }
}

extension widgetslaAttributes.ContentState {
    fileprivate static var smiley: widgetslaAttributes.ContentState {
        widgetslaAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: widgetslaAttributes.ContentState {
         widgetslaAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: widgetslaAttributes.preview) {
   widgetslaLiveActivity()
} contentStates: {
    widgetslaAttributes.ContentState.smiley
    widgetslaAttributes.ContentState.starEyes
}

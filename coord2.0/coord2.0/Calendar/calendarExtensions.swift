//
//  calendarExtensions.swift
//  Coord
//
//  Created by Takoda Denhof on 11/28/20.
//

import Foundation
import EventKit
import SwiftUI

extension EKEvent {
    // This did not work properly and caused wrong event to be used in ForEach
//    public var id: String {
//        return eventIdentifier
//    }
    
    var color: Color {
        return Color(UIColor(cgColor: self.calendar.cgColor))
    }
}
extension TimeInterval {
    static func weeks(_ weeks: Double) -> TimeInterval {
        return weeks * TimeInterval.week
    }
    
    static var week: TimeInterval {
        return 7 * 24 * 60 * 60
    }
}
extension Notification.Name {
    static let eventsDidChange = Notification.Name("EKEXeventsDidChange")
}
extension EKCalendar: Identifiable {
    public var id: String {
        return self.calendarIdentifier
    }
    
    public var color: Color {
        return Color(UIColor(cgColor: self.cgColor))
    }
    
    public var formattedText: Text {
        return Text("•\u{00a0}")
            .font(.headline)
            .foregroundColor(self.color)
            + Text("\(self.title)")
    }
}

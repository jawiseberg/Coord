//
//  list.swift
//  Coord
//
//  Created by Takoda Denhof on 11/28/20.
//

import Foundation
import EventKit
import SwiftUI

struct SelectedCalendarsList: View {
    let selectedCalendars: [EKCalendar]
    
    var joinedText: Text {
        var text = Text("")
        
        for calendar in selectedCalendars {
            text = text + calendar.formattedText + Text("  ")
        }
        
        return text
    }
    
    var body: some View {
        joinedText.foregroundColor(.secondary)
    }
}

//
//  calendarContentView.swift
//  Coord
//
//  Created by Takoda Denhof on 11/28/20.
//

import Foundation
import SwiftUI
import EventKit
import Combine


struct calendarContentView: View {
    enum ActiveSheet {
        case calendarChooser
        case calendarEdit
    }
    
    @State private var showingSheet = false
    @State private var activeSheet: ActiveSheet = .calendarChooser
    
    @ObservedObject var eventsRepository = EventsRepository.shared
    
    @State private var selectedEvent: EKEvent?
    
    func showEditFor(_ event: EKEvent) {
        activeSheet = .calendarEdit
        selectedEvent = event
        showingSheet = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if eventsRepository.events?.isEmpty ?? true {
                        Text("No events available for this calendar selection")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    ForEach(eventsRepository.events ?? [], id: \.self) { event in
                        EventRow(event: event).onTapGesture {
                            self.showEditFor(event)
                        }
                    }
                }
                
                SelectedCalendarsList(selectedCalendars: Array(eventsRepository.selectedCalendars ?? []))
                    .padding(.vertical)
                    .padding(.horizontal, 5)
                
                Button(action: {
                    self.activeSheet = .calendarChooser
                    self.showingSheet = true
                }) {
                    Text("Select calendars")
                }
                .buttonStyle(PrimaryButtonStyle())
                .sheet(isPresented: $showingSheet) {
                    if self.activeSheet == .calendarChooser {
                        CalendarChooser(calendars: self.$eventsRepository.selectedCalendars, eventStore: self.eventsRepository.eventStore)
                    } else {
                        EventEditView(eventStore: self.eventsRepository.eventStore, event: self.selectedEvent)
                    }
                }
            }
            .navigationBarTitle("Upcoming Events")
            .navigationBarItems(trailing: Button(action: {
                self.selectedEvent = nil
                self.activeSheet = .calendarEdit
                self.showingSheet = true
            }, label: {
                //Image(systemName: "plus").frame(width: 44, height: 44)
                Text("Add")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        calendarContentView()
    }
}

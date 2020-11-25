import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    
    @State private var showingAlert = false
    
    //CORE DATA
    /*
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    */
    
    
    
    
    //CALENDAR VIEW
    
    var Events: Array<Event> = Array()
    
    @Environment(\.calendar) var calendar

    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    
    var body: some View {
        
        
        VStack {
            Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Add Event")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Add event details"), message: Text("use commas to split"), dismissButton: .default(Text("Done")))
            }
            
            
            
            CalendarView(interval: year) { date in
                Text("30")
                    .hidden()
                    .padding(8)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .padding(.vertical, 4)
                    .overlay(
                        Text(String(self.calendar.component(.day, from: date)))
                    ).toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            HStack {
                                Button("Calendar") {
                                    print("PressedC")
                                }
                                Button("Todo") {
                                    print("PressedT")
                                }
                                Button("Assignments") {
                                    print("PressedA")
                                }
                            }
                        }
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

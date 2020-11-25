import Foundation

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
    
    //Add more complicated stuff later if you want.
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}

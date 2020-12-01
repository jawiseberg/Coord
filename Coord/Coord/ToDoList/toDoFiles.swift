//
//  toDoFiles.swift
//  Coord
//
//  Created by Takoda Denhof on 11/14/20.
//

import Foundation
import Foundation
import SwiftUI
import Combine
// Task Object
struct item : Identifiable {
    var id = Int()
    var itemName = String()
    var priority = Int()
    var completeBy = Date()
    var stringDate = String() 
    
}
class TaskStore : ObservableObject {
    @Published var taskList = [item]()
}

struct list : Identifiable {
    var id = Int()
    var listName = String()
    var list = TaskStore()
}
class ListStore : ObservableObject {
    @Published var lists = [list]()
}
struct TaskFiles_Previews : PreviewProvider {
    static var previews : some View {
        Text("Hello World ")
    }
}
/*struct assignment : Identifiable {
    
    var id = String()
    var assignmentName = String()
    var assignmentCourse = String()
    var assignmentDueDate = String()
    
}
struct classes : Identifiable {
    var id = String()
    var className = String()
    var type = String()
    var assignmentList = AssignmentStore()
}

class AssignmentStore : ObservableObject {
    @Published var assignments = [assignment]()
    
}
class ClassAssignments : ObservableObject {
    @Published var classAss = [classes]()
}
class rowView : ObservableObject {
    
}

struct TaskFIles_Previews: PreviewProvider {
    static var previews: some View{
        Text("Hello World")
    }
}
*/

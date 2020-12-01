//
//  AssignmentFiles.swift
//  Coord
//
//  Edited by Takoda Denhof on 11/14/20.
//  AssignmentProject
//
//  Created by Bailey Kaplan on 11/6/20.
//

import Foundation
import SwiftUI
import Combine

struct assignment : Identifiable {
    
    var id = String()
    var assignmentName = String()
    var assignmentCourse = String()
    var assignmentDueDate = Date()
    
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

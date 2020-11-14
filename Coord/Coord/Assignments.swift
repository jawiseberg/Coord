//
//  Assignments.swift
//  Coord
////  Created by Bailey Kaplan on 11/4/20.
//
//  Edited by Takoda Denhof on 11/14/20.
//

import Foundation
import SwiftUI
import CoreData
import Combine
// Class List
struct AssignmentHome : View {
    @ObservedObject var classStore = ClassAssignments()
    @State var name = String()
    
    func newClass(){
        classStore.classAss.append(classes(id : "", className: self.name, assignmentList: AssignmentStore() ))
        self.name = ""
    }
    
    var body: some View {
        NavigationView {
            VStack{
            HStack{
            TextField("Classes", text : self.$name)
            Button(action : newClass, label: {Text("Add List")})
            }
            VStack{
            List{
                ForEach(self.classStore.classAss){ classAss in NavigationLink(destination : AssignmentView()){
                    Text(classAss.className)
            }}.onMove(perform: self.move)
                .onDelete(perform: self.delete)
            }.padding(.all).navigationBarTitle("Assignment Lists")
        .navigationBarItems(trailing: EditButton())
        }}
    }
    }
    // Move data within the array to allow visualiztion. Swaps Index's
    func move(from source : IndexSet, to destination : Int) {
        self.classStore.classAss.move(fromOffsets: source, toOffset: destination)
    }
    // Deleting Row
    func delete(at offsets : IndexSet) {
        self.classStore.classAss.remove(atOffsets: offsets)
    }
}


// List of Specific Assignment Based on Classes you chose from
struct AssignmentView : View {
    @ObservedObject var assignmentStore = AssignmentStore()
    @State var newAssignment : String = ""
    @State var name = ""
    @State var type = ""
    @State var dueDate = ""
    @State var nameRetrieved = ""
    @State var courseRetrieved = ""
    @State var dueDateRetrieved = ""
    var assignmentTypes = ["Homework","Project","Notes","Study","Exam"]
    

    // View to Add Assignments
    var addAssignment : some View{
    NavigationView{
            List{
        VStack{
        
        Text("Assignments")
            .font(.title)
    
        TextField("Enter the name of your assignment", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
        
        Picker(selection : $type, label : Text("Select Type")){
                
                ForEach(0 ..< assignmentTypes.count){Text(String(self.assignmentTypes[$0]))
                
                }
            
            }.padding()
        
        TextField("When is your assignment due?", text: $dueDate).textFieldStyle(RoundedBorderTextFieldStyle())
    }
    }
    }
    }
    
// Body View
    var body: some View {
        NavigationView{
            List{
            HStack {
            NavigationLink(destination : addAssignment, label : {Text("Add Assignment")})}

                VStack {
                    List {
                        ForEach(self.assignmentStore.assignments) { task in
                            Text(task.assignmentName)
                        }.onMove(perform: self.move)
                            .onDelete(perform: self.delete)
                            }.padding(.all).navigationBarTitle("Assignments")
                    .navigationBarItems(trailing: EditButton())
                }
        }

    }
    }
    
    func addNewAssignmentfunc() {
        assignmentStore.assignments.append(assignment(id: "" , assignmentName: self.name, assignmentCourse: self.type, assignmentDueDate: self.dueDate))
        self.newAssignment = ""
    }
    
    /*
    func getName(iD: String)-> String {
        //@ObservedObject var tempTaskStore = TaskStore()
        //if let tempTask = taskStore[iD] as? [String: Any]{
        //return tempTask.assignmentName
    }
 */
    
    func getCourse()-> String {
        return type
    }
    
    func getDueDate()-> String {
        return dueDate
    }
    
    
    func move(from source : IndexSet, to destination : Int) {
        assignmentStore.assignments.move(fromOffsets: source, toOffset: destination)
    }

    func delete(at offsets : IndexSet) {
        assignmentStore.assignments.remove(atOffsets: offsets)
    }

        
}


struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentHome()
    }
}

struct DropDown : View {
    @State var expand = false
    var body: some View {
        VStack() {
            VStack(spacing: 30){
                HStack(){
                    Text("Assignment Completion")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 13, height: 6)
                        .foregroundColor(.black)
                }.onTapGesture{
                    self.expand.toggle()
                }
                if expand {
                    Button(action: {
                        print("1")
                        self.expand.toggle()
                    }) {
                        Text("Not Started")
                    }.foregroundColor(.black)
                    Button(action: {
                        print("2")
                        self.expand.toggle()
                    }){
                        Text("In Progress")
                    }.foregroundColor(.black)
                    Button(action: {
                        print("3")
                        self.expand.toggle()
                    }){
                        Text("Completed")
                }.foregroundColor(.black)
            }
        }
    }
    }
}

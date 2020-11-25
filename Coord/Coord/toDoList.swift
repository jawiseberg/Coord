//
//  toDoList.swift
//  Coord
//
//  Created by Takoda Denhof on 11/14/20.
//

import Foundation
import SwiftUI
import CoreData
import Combine
struct toDoList : View {
    @ObservedObject var taskStore = TaskStore()
    @State var id : Int = 0
    @State var name : String = ""
    @State var itemPriority = Int()
    @State var date = Date()
    var available_priorities = [1,2,3]
    func newItem(){
        taskStore.taskList.append(item(id: (taskStore.taskList.count + 1),itemName: self.name, priority: self.itemPriority, completeBy: self.date, stringDate : dateToString()))
        self.name = ""
        self.itemPriority = Int()
        self.date = Date()
    }
    // The View that allows us to add assignments
    
    
    // Combining the ability to add items with the actual visual of the to do list
    func dateToString()-> String{
        let date = self.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let answer =  String(dateFormatter.string(from: date))
        return answer
    }
    var editTask : some View {
        NavigationView{
            VStack{
            HStack{
            
                    TextField("New item", text : self.$name)
                    
                    DatePicker(selection : self.$date, displayedComponents : .date) {Text("Date")}
                
            }
                Picker(selection : $itemPriority, label : Text("Priority")){
                    ForEach(0..<available_priorities.count){
                        Text(String(self.available_priorities[$0]))}.padding()}
            }
            
        }
    }
    func add_delete(){
        
    }
    var body : some View{
        NavigationView{
            
            VStack{
                VStack{
                HStack{
                
                        TextField("New item", text : self.$name)
                        
                        DatePicker(selection : self.$date, displayedComponents : .date) {Text("Date")}
                    
                }
                    Picker(selection : $itemPriority, label : Text("Priority")){
                        ForEach(0..<available_priorities.count){
                            Text(String(self.available_priorities[$0]))}.padding()}
                }
                Button(action : newItem, label : {Text("Add Item")})
                
                List{
                    ForEach(self.taskStore.taskList){ taskList in NavigationLink(destination : editTask, label: {
                                                                        
                        HStack{
                            Text(taskList.itemName)
                            Text(" | ")
                            Text(String(taskList.priority))
                            Text(" | ")
                            Text(taskList.stringDate)
                        
                        }})}.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarTitle("List")
            .navigationBarItems(trailing: EditButton())
                }
            
        }
        
}
    
    
    func move(from source : IndexSet, to destination : Int) {
        self.taskStore.taskList.move(fromOffsets: source, toOffset: destination)
    }
    // Deleting Row
    func delete(at offsets : IndexSet) {
        self.taskStore.taskList.remove(atOffsets: offsets)
    }
}
    

    
// Home View
struct toDoListHome : View {
    
    @ObservedObject var listStore = ListStore()
    @State var name : String = ""
    // Adding a new list
    func newList(){
        listStore.lists.append(list(id: (listStore.lists.count + 1), listName: self.name, list : TaskStore()))
        self.name = ""
        
    }
    // Body
    var body : some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("To Do Lists", text : self.$name)
                    Button(action : newList, label : {Text("Add List")})
                }
                    VStack{
                        List{
                            ForEach(self.listStore.lists){ lists in NavigationLink(destination : toDoList(), label : {Text(lists.listName)})}.onMove(perform: self.move)
                                .onDelete(perform: self.delete)
                                }.padding(.all).navigationBarTitle("To Do Lists")
                        .navigationBarItems(trailing: EditButton())
                        }
                    }
                
            }
        }
    
    


    func move(from source : IndexSet, to destination : Int) {
        listStore.lists.move(fromOffsets: source, toOffset: destination)
    }

    func delete(at offsets : IndexSet) {
        listStore.lists.remove(atOffsets: offsets)
    }
}

struct toDoList_Previews: PreviewProvider {
    static var previews: some View {
        toDoListHome()
    }
}

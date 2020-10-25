//
//  toDoListViewController.swift
//  Coord
//
//  Created by Takoda Denhof on 10/22/20.
//

/*
import Foundation
import SwiftUI
//Item Row
struct ItemRow: View {
    var item: Item
    var body: some View {
        Text(Item.title ?? "No Title", tableName: Item)
   }
}


// Create To Do List
struct toDoList: View {
    @Environment(\.managedObjectContext) var context
    @State private var taskName: String = ""
    // Fetching from data source
    @FetchRequest(
        entity: Item.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Item.date, ascending: false)],
        predicate: NSPredicate(format: "complete == %@", NSNumber(value: false))
    ) var notCompletedTasks: FetchedResults<Item>
    // adding item to list
    func addItem() {
        let newItem = Item(context: context)
        newItem.itemID = UUID()
        newItem.complete = false
        newItem.title = taskName
        newItem.date = Date()
        newItem.about = ""
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    // Updating to do list --> Current capabilites allow to mark complete
    func updateItem(_ item : Item){
        let Complete = true
        let itemId = item.id! as NSUUID
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        fetchRequest.predicate = NSPredicate(format: "itemId == %@", itemID as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            let test = try context.fetch(fetchRequest)
            let itemUpdate = test[0] as! NSManagedObject
            itemUpdate.setValue(complete, forKey: "complete")
        } catch {
            print(error)
        }
    }
    // Viewing the to do list
    var body: some View {
        VStack{
            TextField("task name", text: $taskName)
            Button(action: {
                self.addItem()
            }){
                Text("Add Task")
            }
            HStack{
                Button(action: {
                    self.updateItem()
                }){
                    ItemRow(Item: Item)
                }
                List{
                    ForEach(notCompletedTasks){ Item in
                                    ItemRow(Item:Item)
                    }
            
                }
            }
        }

    }
   
}

struct toDoList_Previews: PreviewProvider {
    static var previews : some View{
        toDoList()
    }
}



struct toDoList_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
*/

//
//  HomeContentView.swift
//  Coord
//
//  Created by Takoda Denhof on 11/29/20.
//

import Foundation
import SwiftUI

struct homeView : View{
    func nothing() -> Void{
       
    }
    var body : some View{
    NavigationView{
        VStack{
            Button( action: nothing, label : { NavigationLink( destination : calendarContentView(), label: {Text("Calendar")})})
            Button(action: nothing, label : { NavigationLink( destination : toDoListHome(), label :  {Text("To Do List")})})
            Button(action : nothing, label : {
                NavigationLink(destination : AssignmentHome(), label : {Text("Assignments")})
            })
    }
    }
}
}
struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}

//
//  SwiftUIView.swift
//  coord2.0
//
//  Created by Takoda Denhof on 12/2/20.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView{
            VStack{
            NavigationLink(destination: AssignmentHome(), label: {Text("Assignments")})
            NavigationLink(destination: toDoListHome(), label: {Text("To Do List")})
            NavigationLink(destination: calendarContentView(), label: {Text("Calendar")})
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

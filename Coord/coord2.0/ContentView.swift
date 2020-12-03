//
//  ContentView.swift
//  coord2.0
//
//  Created by Takoda Denhof on 12/2/20.
//

import SwiftUI

struct ContentView: View {
    func nothing()->Void{
        
    }
    var body: some View {
        NavigationView{
           NavigationLink(destination : toDoListHome(),label : {Text("Welcome to COORD. Click Here")})
        }
}
        
}
struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Event.swift
//  Coord
//
//  Created by Jake Wiseberg on 10/24/20.
//

import Foundation
import UIKit

struct Event {
    
    var iD: Int = 0
    var title: String = ""
    var startTime: Int = 0
    var endTime: Int = 0
    var location: String = ""
    var name: String = ""
    
    func getID()-> Int {
        return iD
    }
    
    func getName()-> String {
        return name
    }
    
    func setName(newName: String)-> String {
        return newName
    }
    
    func getStartTime()-> Int {
        return startTime
    }
    
    func setStartTime(newStartTime: Int)-> Int {
        return newStartTime
    }
    
    func getEndTime()-> Int {
        return endTime
    }
    
    func setEndTime(newEndTime: Int)-> Int {
        return newEndTime
    }
    
    func setCourse(newCourse: String)-> String {
        return newCourse
    }
    
    func getLocation()-> String {
        return location
    }
    
    func setLocation(newLocation: String)-> String {
        return newLocation
    }
    
    
}

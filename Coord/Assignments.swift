//
//  Assignments.swift
//  Coord
//
//  Created by Bailey Kaplan on 10/24/20.
//

import Foundation

struct Assignments {
    
    var iD: UUID
    var title: String
    var dueDate: Date
    var dueTime: Date
    var course: String
    var state: String
    
    func getID()-> UUID {
        return iD
    }
    
    func getTitle()-> String {
        return title
    }
    
    mutating func setTitle(title: String) {
        self.title = title
    }
    
    func getDueDate()-> Date {
        return dueDate
    }
    
    mutating func setDueDate(dueDate: Date) {
        self.dueDate = dueDate
    }
    
    func getDueTime()-> Date {
        return dueTime
    }
    
    mutating func setDueTime(dueTime: Date) {
        self.dueTime = dueTime
    }
    
    func getCourse()-> String {
        return course
    }
    
    mutating func setCourse(course: String) {
        self.course = course
    }
    
    func getState()-> String {
        return state
    }
    
    mutating func setState(state: String) {
        self.state = state
    }
    
 }

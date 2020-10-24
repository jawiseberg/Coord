//
//  Assignments.swift
//  Coord
//
//  Created by Bailey Kaplan on 10/24/20.
//

import Foundation
import UIKit

struct Assignments {
    
    var iD: Int = 0
    var title: String = ""
    var dueDate: Int = 0 //how do we express date best
    var dueTime: Int = 0 //how do we express time best
    var course: String = ""
    var state: String = ""
    
    func getID()-> Int {
        return iD
    }
    
    func getTitle()-> String {
        return title
    }
    
    func setTitle(newTitle: String)-> String {
        return newTitle
    }
    
    func getDueDate()-> Int {
        return dueDate
    }
    
    func setDueDate(newDueDate: Int)-> Int {
        return newDueDate
    }
    
    func getDueTime()-> Int {
        return dueTime
    }
    
    func setDueTime(newDueTime: Int)-> Int {
        return newDueTime
    }
    
    func getCourse()-> String {
        return course
    }
    
    func setCourse(newCourse: String)-> String {
        return newCourse
    }
    
    func getState()-> String {
        return state
    }
    
    func setState(newState: String)-> String {
        return newState
    }
    
 }

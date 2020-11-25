import Foundation

struct Event {
    
    var eventID: UUID
    var title: String
    var startTime: Date
    var endTime: Date
    var location: String
    var details: String
    
    init(title:String, startTime:Date, endTime:Date, location:String, details:String) {
        eventID = UUID.init()
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.details = details
    }
    
    func getEventID()-> UUID {
        return eventID
    }
    
    func getTitle()-> String {
        return title
    }
    
    mutating func setTitle(title: String) {
        self.title = title
    }
    
    func getStartTime()-> Date {
        return startTime
    }
    
    mutating func setStartTime(startTime: Date) {
        self.startTime = startTime
    }
    
    func getEndTime()-> Date {
        return endTime
    }
    
    mutating func setEndTime(endTime: Date) {
        self.endTime = endTime
    }
    
    func getLocation()-> String {
        return location
    }
    
    mutating func setLocation(location: String) {
        self.location = location
    }
    
    func getDetails()-> String {
        return details
    }
    
    mutating func setDetails(details: String) {
        self.details = details
    }
}

//
//  Blueprint+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/26/23.
//
//

import Foundation
import CoreData

public class BBB_Blueprint: NSManagedObject{
    @NSManaged public var difficulty: Int64
    @NSManaged public var icon: Data
    @NSManaged public var timeline: Float
    @NSManaged public var completed: Bool
    @NSManaged public var progress: Int64
    @NSManaged public var lastEntryDate: Date?
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        difficulty = 1
    }
    
    required public init(context: NSManagedObjectContext) {
          let entity = NSEntityDescription.entity(forEntityName: "Blueprint", in: context)!
          super.init(entity: entity, insertInto: context)
          difficulty = 1
          icon = Data()
          timeline = 0.0
          completed = false
          progress = 0
      }
      
    
    
    func setDifficulty(_ difficulty: Int64){
        self.difficulty = difficulty
        switch difficulty{
        case 1:
            self.timeline = 30
        case 2:
            self.timeline = 1
        case 3:
            self.timeline = 2
        default:
            self.timeline = 15
        }
        
    }
    
    
    func trackProgress()->Int64{
        //gets the current date and time
        let now = Date()
        
        //checks if the last entry date exists
        guard let lastEntryDate = self.lastEntryDate else{
            self.lastEntryDate = now
            return self.progress
        }
        
        //calculates the number of days between current data and the last entry date
        let calendar = Calendar.current
        let daysSinceLastEntry = calendar.dateComponents([.day], from: lastEntryDate, to: now).day ?? 0
        
        //checks if 24 hours have passed since the last entry
        guard daysSinceLastEntry >= 1 else{
            return self.progress
        }
        
        //updates the progress if 24 hours have passed and the task is not yet completed
        if !self.completed{
            self.progress += 1
        }
        
        //updates the last entry date
        self.lastEntryDate = now
        
        return self.progress
        
        
    }
    
   
    
    
    
   
}

extension BBB_Blueprint{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BBB_Blueprint> {
        return NSFetchRequest<BBB_Blueprint>(entityName: "Blueprint")
    }
    
   
}

let fetchRequest: NSFetchRequest<BBB_Blueprint> = BBB_Blueprint.fetchRequest()



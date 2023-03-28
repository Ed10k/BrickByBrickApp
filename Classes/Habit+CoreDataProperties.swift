//
//  Habit+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/26/23.
//
//

import Foundation
import CoreData


public class BBB_Habit:NSManagedObject{
    //public variables
    @NSManaged public var about: String?
    @NSManaged public var name: String?
    @NSManaged public var reward: Int64
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
    }
    
    //constructor
    convenience init(about: String? = nil, name: String? = nil, reward: Int64, context: NSManagedObjectContext) {
            let entity = NSEntityDescription.entity(forEntityName: "Habit", in: context)!
            self.init(entity: entity, insertInto: context)
            self.about = about
            self.name = name
            self.reward = reward
        }
    
    
    
    
    
    
}

extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BBB_Habit> {
        return NSFetchRequest<BBB_Habit>(entityName: "Habit")
    }


}

extension BBB_Habit : Identifiable {

}

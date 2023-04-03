//
//  Habit+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Grayson on 4/3/23.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var dateCompleted: String?
    @NSManaged public var level: String?
    @NSManaged public var name: String?

}

extension Habit : Identifiable {

}

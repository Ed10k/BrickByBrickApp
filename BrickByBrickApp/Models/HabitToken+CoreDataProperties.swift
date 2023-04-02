//
//  HabitToken+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Grayson on 4/2/23.
//
//

import Foundation
import CoreData


extension HabitToken {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitToken> {
        return NSFetchRequest<HabitToken>(entityName: "HabitToken")
    }

    @NSManaged public var amount: Int64

}

extension HabitToken : Identifiable {

}

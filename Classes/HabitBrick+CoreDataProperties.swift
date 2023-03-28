//
//  HabitBrick+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/26/23.
//
//

import Foundation
import CoreData



class BBB_HabitBrick: NSManagedObject{
    @NSManaged public var about: String?
    @NSManaged public var balance: Int64
    @NSManaged public var icon: Data?
    @NSManaged public var name: String?
    @NSManaged public var value: Float
    
    
    override public func awakeFromInsert() {
            super.awakeFromInsert()
            balance = 5 //sets the default value for balance
            name = "Habit Brick" //sets the defualt name of the habit brick
            value = 2.5 //the default exchange rate for habit bricks
            about = "This is a habit brick, you earn this brick by forming a new habit." // the default description
        }
        
        //set balance
        func setBalance(_ balance: Int64){
            self.balance = balance
        }
        
        //adds to balance
        func addToBalance(_ reward: Int64){
            self.balance += reward
        }
        
        //subtracts from balance
        func subtractBalance(_ deduct: Int64){
            if self.balance - deduct < 0{
                self.balance = 0
            }
            else{
                self.balance -= deduct
            }
            
        }
        
        //gets the current balance
        func getBalance() -> Int64{
            return self.balance
        }
        
        //returns the exchange rate
        func exchangeRate() -> Float{
            return self.value
        }
        
        //sets the exchange rate
        func setExchangeRate(_ newRate: Float){
            self.value = newRate
            
        }
        
    }

  
    


extension BBB_HabitBrick {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BBB_HabitBrick> {
        return NSFetchRequest<BBB_HabitBrick>(entityName: "HabitBrick")
    }

    

}

extension HabitBrick : Identifiable {

}

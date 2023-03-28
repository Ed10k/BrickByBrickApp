//
//  ProductivityBrick+CoreDataProperties.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/26/23.
//
//

import Foundation
import CoreData




public class BBB_ProductivityBrick: NSManagedObject{
    
    //public variables
    @NSManaged private var about: String?
    @NSManaged public var balance: Int64
    @NSManaged public var icon: Data?
    @NSManaged private var name: String?
    @NSManaged public var value: Float

    override public func awakeFromInsert() {
        super.awakeFromInsert()
        balance = 25 //sets the default value for balance
        name = "Productivity Brick" //sets the defualt name of the productivity brick
        value = 0.5 //the default exchange rate for productivity bricks
        about = "This is a productivity brick, you earn this brick by being productive." // the default description
    }
    
    //constructor
    required public convenience init(name: String, balance: Int64, value: Float, about: String, icon: Data?, context: NSManagedObjectContext) {
            self.init(entity: BBB_ProductivityBrick.entity(), insertInto: context)
            self.name = name
            self.balance = balance
            self.value = value
            self.about = about
            self.icon = icon
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



extension BBB_ProductivityBrick {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BBB_ProductivityBrick> {
        return NSFetchRequest<BBB_ProductivityBrick>(entityName: "ProductivityBrick")
    }


}

extension ProductivityBrick : Identifiable {

}

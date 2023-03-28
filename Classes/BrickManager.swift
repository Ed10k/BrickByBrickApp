//
//  BrickManager.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/28/23.
//

import Foundation
import CoreData

class BBB_BrickManager{
    
    var habitBrick: BBB_HabitBrick?
    var productivityBrick: BBB_ProductivityBrick
    
    
    init(){
        //initialize the habit and productivity bricks
        habitBrick = BBB_HabitBrick()
        productivityBrick = BBB_ProductivityBrick()
    }
    
    
    //Setters for habit brick properties
    func setHabitBrickBalance(_ balance: Int64){
        habitBrick?.setBalance(balance)
    }
    
    func addToHabitBrickBalance(_ reward: Int64){
        habitBrick?.addToBalance(reward)
    }
    
    func subtractHabitBrickBalance(_ deduct: Int64) {
           habitBrick?.subtractBalance(deduct)
       }
       
    func setHabitBrickExchangeRate(_ newRate: Float) {
       habitBrick?.setExchangeRate(newRate)
    }

    // Getters for habit brick properties

    func getHabitBrickBalance() -> Int64 {
       return habitBrick?.getBalance() ?? 0
    }

    func getHabitBrickExchangeRate() -> Float {
       return habitBrick?.exchangeRate() ?? 0.0
    }

    // Setters for productivity brick properties

    func setProductivityBrickBalance(_ balance: Int64) {
       productivityBrick.setBalance(balance)
    }

    func addToProductivityBrickBalance(_ reward: Int64) {
       productivityBrick.addToBalance(reward)
    }

    func subtractProductivityBrickBalance(_ deduct: Int64) {
       productivityBrick.subtractBalance(deduct)
    }

    func setProductivityBrickExchangeRate(_ newRate: Float) {
       productivityBrick.setExchangeRate(newRate)
    }

    // Getters for productivity brick properties

    func getProductivityBrickBalance() -> Int64 {
       return productivityBrick.getBalance()
    }

    func getProductivityBrickExchangeRate() -> Float {
       return productivityBrick.exchangeRate()
    }
    func exchnage(_ convert: Int64, description: String = "This gives the user the ability to convert from a habit brick to a productivity brick and from a productivity brick to a habit brick"){
        if convert == 1{
            let prodTokens = Float(habitBrick?.getBalance() ?? 0) * (habitBrick?.value ?? 0.0)
            productivityBrick.addToBalance(Int64(prodTokens))
        }
        if convert == 2{
            let habitTokens = Float(productivityBrick.getBalance()) * productivityBrick.value
            
            habitBrick?.addToBalance(Int64(habitTokens))
            
        }
    }
}

//
//  RightViewController.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/17/23.
//

import UIKit
import CoreMotion
import CoreData

class RightViewController: UIViewController {
 
    @IBOutlet weak var weeklyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var blockView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func didTapClearButt(_ sender: Any) {
        dateLabel.text = ""
        nameLabel.text = ""
        levelLabel.text = ""
        weeklyLabel.text = ""
        clearDate()
        clearName()
        clearLevel()
    }
    
    func clearName() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let habits = try managedContext.fetch(fetchRequest)
            guard let habit = habits.first else {
                return
            }
            habit.name =  ""
            print("Habit date cleared.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }
    
    func clearLevel() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let habits = try managedContext.fetch(fetchRequest)
            guard let habit = habits.first else {
                return
            }
            habit.level =  ""
            print("Habit name cleared.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }
    
    func clearDate() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let habits = try managedContext.fetch(fetchRequest)
            guard let habit = habits.first else {
                return
            }
            habit.dateCompleted =  ""
            print("Habit date cleared.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = fetchHabitDate()
        levelLabel.text = fetchHabitLevel()
        nameLabel.text = fetchHabitName()
        
        blockView.layer.cornerRadius = 20.0
        blockView.layer.masksToBounds = true
        
        titleLabel.layer.cornerRadius = 20.0
        titleLabel.layer.masksToBounds = true
        
        
        let habitName = fetchHabitName()
        var weeklyText = weeklyGenerator(name: habitName ?? "")
        
        weeklyLabel.text = weeklyText
    }
    
    func weeklyGenerator(name: String) -> String {
        switch name {
        case "Journaling":
            return "Week 1: Open your journal everyday.\nWeek 2: Write a sentence everyday.\nWeek 3: Journal everyday!"
        case "Working Out":
            return "Week 1: Put your gym shoes on everyday.\nWeek 2: Show up to the gym everyday.\nWeek 3: Go to the gym, do 1 exercise everyday.\nWeek 4: Go to the gym, do 3 exercises everyday.\nWeek 5: Go to the gym and work out everyday!"
        case "Reading":
            return "Week 1: Open a book everyday.\nWeek 2: Read a paragraph everyday.\nWeek 3: Read 2 pages everyday.\nWeek 4: Read everyday!"
        default:
            return ""
        }
    }

    
    
    func fetchHabitDate() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let entities = try managedContext.fetch(fetchRequest)
            guard let entity = entities.first else {
                return nil
            }
            // Return the value of the name attribute
            return entity.dateCompleted
            
        } catch let error as NSError {
            print("Could not fetch entities. \(error), \(error.userInfo)")
            return nil
        }
    }

    func fetchHabitName() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let entities = try managedContext.fetch(fetchRequest)
            guard let entity = entities.first else {
                return nil
            }
            // Return the value of the name attribute
            return entity.name
            
        } catch let error as NSError {
            print("Could not fetch entities. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func fetchHabitLevel() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        do {
            let entities = try managedContext.fetch(fetchRequest)
            guard let entity = entities.first else {
                return nil
            }
            // Return the value of the name attribute
            return entity.level
            
        } catch let error as NSError {
            print("Could not fetch entities. \(error), \(error.userInfo)")
            return nil
        }
    }
    
        func subtractToken(){
            print("decrementing!")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<HabitToken> = HabitToken.fetchRequest()
            do {
                let entities = try managedContext.fetch(fetchRequest)
                guard let entity = entities.first else {
                    return
                }
                // Decrement the amount attribute
                entity.amount -= 1
                
                // Save the changes
                try managedContext.save()
                
                
            } catch let error as NSError {
                print("Could not fetch entities. \(error), \(error.userInfo)")
            }
        }
    
    
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



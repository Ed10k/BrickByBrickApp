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
 
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var blockView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func didTapClearButt(_ sender: Any) {
        dateLabel.text = "[date]"
        nameLabel.text = "[name]"
        levelLabel.text = "[level]"
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



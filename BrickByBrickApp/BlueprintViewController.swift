//
//  BlueprintViewController.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/23/23.
//

import UIKit
import CoreData

class BlueprintViewController: UIViewController {
    
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("View loaded properly")
        
        //upwards presentation don't touch
        let viewControllerToPresent = BlueprintViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        navigationController?.present(viewControllerToPresent, animated: true, completion: nil)
        
        let calendar = Calendar.current
        var futureDate = calendar.date(byAdding: .weekOfMonth, value: 5, to: Date())
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        datedLabel.text = dateFormatter.string(from: futureDate!)
        
        levelLabel.layer.cornerRadius = 20.0
        levelLabel.layer.masksToBounds = true
        
        datedLabel.layer.cornerRadius = 20.0
        datedLabel.layer.masksToBounds = true
        
        titleLabel.layer.cornerRadius = 20.0
        titleLabel.layer.masksToBounds = true

    }
    
    func setDateToDatedLabel() {
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
            habit.dateCompleted = datedLabel.text ?? ""
            print("Habit date set.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }

    func setNameToSegContLabel() {
        let selectedSegmentTitle = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)

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
            habit.name = selectedSegmentTitle ?? ""
            print("Habit name set.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }
    
    func setLevelToLevelLabel() {
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
            habit.level = levelLabel.text ?? ""
            print("Habit level set.")
            // Save the changes
            try managedContext.save()

        } catch let error as NSError {
            print("Could not fetch habits. \(error), \(error.userInfo)")
        }
    }

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var datedLabel: UILabel!
    
    @IBAction func didTapSubmitButt(_ sender: UIButton) {
        
        
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
                
                
                if entity.amount < 3 {
                    let alertController = UIAlertController(title: "Oops!", message: "Must have at least 3 Habit Tokens.   You got this.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "I will be productive", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
                } else {
                    setDateToDatedLabel()
                    setLevelToLevelLabel()
                    setNameToSegContLabel()
                    entity.amount -= 3
                    
                    
                    // Save the changes and dismiss the view controller
                    try managedContext.save()
                    dismiss(animated: true, completion: nil)
                }
                
            } catch let error as NSError {
                print("Could not fetch entities. \(error), \(error.userInfo)")
            }
        
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        let calendar = Calendar.current
        var futureDate = calendar.date(byAdding: .weekOfMonth, value: 5, to: Date())
        
        let dateFormatter = DateFormatter()
        
        switch sender.selectedSegmentIndex {
        case 0:
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            datedLabel.text = dateFormatter.string(from: futureDate!)
            levelLabel.text = "2"
            
        case 1:
            futureDate = calendar.date(byAdding: .weekOfMonth, value: 6, to: Date())
            
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            datedLabel.text = dateFormatter.string(from: futureDate!)
            levelLabel.text = "3"
            
        case 2:
            futureDate = calendar.date(byAdding: .weekOfMonth, value: 4, to: Date())
            
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            datedLabel.text = dateFormatter.string(from: futureDate!)
            levelLabel.text = "1"
            
        default:
            break
        }
        
       

        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
}

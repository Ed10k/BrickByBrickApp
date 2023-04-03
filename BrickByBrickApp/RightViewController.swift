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

    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
        let futureDate = calendar.date(byAdding: .weekOfMonth, value: 4, to: Date())
        
        let dateFormatter = DateFormatter()
        
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateLabel.text = dateFormatter.string(from: futureDate!)
        
        motionManager.accelerometerUpdateInterval = 0.2 // Set the update interval to 0.2 seconds
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let accelerometerData = data else { return }
            
            // Check for movement
            if accelerometerData.acceleration.x > 0.1 || accelerometerData.acceleration.y > 0.1 || accelerometerData.acceleration.z > 0.1 {
                // Perform function x()
                self.subtractToken()
            }
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



//
//  ViewController.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/17/23.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    

    

        @IBOutlet weak var myLabel: UILabel!
    
    // The managed object context for Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "BrickByBrickApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
        var managedObjectContext: NSManagedObjectContext {
            persistentContainer.viewContext
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            // Create a new instance of the entity class
            let myEntity = HabitToken(context: managedObjectContext)

            // Set its properties to some fake values
            myEntity.amount = 1

            // Save the entity to the managed object context
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }


            // Fetch the Core Data entity you're interested in
            fetchTokens()
        }

    func fetchTokens()  {
        let fetchRequest: NSFetchRequest<HabitToken> = HabitToken.fetchRequest()

        do {
            // Perform the fetch request
            let result = try managedObjectContext.fetch(fetchRequest)

            if let myEntity = result.first {
                // Access the value you're interested in
                let myValue = myEntity.amount

                // Display the value in the label
                myLabel.text = String(myValue)
            } else {
                print("No results found")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    
    @IBAction func didClearTokes(_ sender: Any) {
        let request: NSFetchRequest<HabitToken> = HabitToken.fetchRequest()
            request.fetchLimit = 1
            
            do {
                let tokens = try managedObjectContext.fetch(request)
                if let token = tokens.first {
                    token.amount = 0 // Set amount to 0
                    try managedObjectContext.save()
                    myLabel.text = String(token.amount)
                    
                } else {
                    // Handle case when there are no tokens
                    print("No tokens found.")
                }
            } catch let error as NSError {
                // Handle any errors
                print("Could not fetch. \(error), \(error.userInfo)")
            }
    }
    
    @IBAction func didIncTokes(_ sender: UIButton) {
        fetchTokens()

        let request: NSFetchRequest<HabitToken> = HabitToken.fetchRequest()
            request.fetchLimit = 1
            

            do {
                let tokens = try managedObjectContext.fetch(request)
                
                // Increase the 'amount' value by 1
                if let token = tokens.first {
                    token.amount += 1
                    
                    // Save the entity to the managed object context
                    do {
                        try managedObjectContext.save()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                    
                    // Update the label with the new 'amount' value
                    myLabel.text = String(token.amount)
                } else {
                    // Create a new token with fake data
                    let newToken = HabitToken(context: managedObjectContext)
                    newToken.amount = 1
                    
                    // Save the entity to the managed object context
                    do {
                        try managedObjectContext.save()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                    
                    // Update the label with the new 'amount' value
                    myLabel.text = String(newToken.amount)
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
    }
    
    @IBAction func didTapBlueprintButt(_sender: Any){
        
    }
    
    @IBAction func didTapProdButton(_sender: Any){
        self.performSegue(withIdentifier: "centerToLeftSegue", sender: self)
    }
    
    @IBAction func didTapSettingsButt(_sender: Any){
        self.performSegue(withIdentifier: "centerToRightSegue", sender: self)
    }

    
}




    



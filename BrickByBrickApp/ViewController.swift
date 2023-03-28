//
//  ViewController.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/17/23.
//

import UIKit
import CoreData



class ViewController: UIViewController {
    
    //data for the table
    var items:[Currency]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reference to managed object context, can use this to retrieve and save data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        func fetchCurrency(){
            //Fetch the currency from Core Data to display in the main screen
            do{
                self.items = try! context.fetch(Currency.fetchRequest())
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            catch{
                
            }
            
        
        }
        
        func didTapProdButton(_sender: Any){
            self.performSegue(withIdentifier: "centerToLeftSegue", sender: self)
        }
        
        @IBAction func didTapSettingsButt(_sender: Any){
            self.performSegue(withIdentifier: "centerToRightSegue", sender: self)
        }
        
        
        
        
        
        
        
    }}



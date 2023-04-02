//
//  BlueprintViewController.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/23/23.
//

import UIKit

class BlueprintViewController: UIViewController {
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var datedLabel: UILabel!
    
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        let calendar = Calendar.current
        var futureDate = calendar.date(byAdding: .weekOfMonth, value: 5, to: Date())
        
        let dateFormatter = DateFormatter()
        
        switch sender.selectedSegmentIndex {
        case 0:
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            datedLabel.text = dateFormatter.string(from: futureDate!)
            
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

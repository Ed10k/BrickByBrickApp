//
//  LeftViewController.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/17/23.
//

import UIKit

class LeftViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapHome(_sender: Any){
        self.performSegue(withIdentifier: "leftToCenterSegue", sender: self)
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



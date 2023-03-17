//
//  ViewController.swift
//  BrickByBrickApp
//
//  Created by Joseph Edozie on 3/17/23.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func didTapProdButton(_sender: Any){
        self.performSegue(withIdentifier: "centerToLeftSegue", sender: self)
    }
    
    @IBAction func didTapSettingsButt(_sender: Any){
        self.performSegue(withIdentifier: "centerToRightSegue", sender: self)
    }

    
}




    



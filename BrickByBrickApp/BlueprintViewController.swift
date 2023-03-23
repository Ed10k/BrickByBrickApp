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

        let viewControllerToPresent = BlueprintViewController()
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        navigationController?.present(viewControllerToPresent, animated: true, completion: nil)
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

//
//  CompleteClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class CompleteClothesViewController: UIViewController {

    @IBOutlet weak var SelectView: UIView!
    @IBOutlet weak var GoalButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SelectView.layer.cornerRadius = 10
        SelectView.layer.masksToBounds = true
        
        GoalButton.layer.cornerRadius = 10
        GoalButton.layer.masksToBounds = true
        DeleteButton.layer.cornerRadius = 10
        DeleteButton.layer.borderWidth = 1
        DeleteButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

//
//  DeleteAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 25/07/23.
//

import UIKit

class DeleteAlertViewController: UIViewController {
    
    @IBOutlet weak var DeleteView: UIView!
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var YesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DeleteView.layer.cornerRadius = 10
        DeleteView.layer.masksToBounds = true
        
        YesButton.layer.cornerRadius = 10
        YesButton.layer.masksToBounds = true
        NoButton.layer.cornerRadius = 10
        NoButton.layer.borderWidth = 1
        NoButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
    }

    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

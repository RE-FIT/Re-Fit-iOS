//
//  DuplicateAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class DuplicateAlertViewController: UIViewController {
    
    @IBOutlet weak var AlertView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AlertView.layer.cornerRadius = 10
        AlertView.layer.masksToBounds = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

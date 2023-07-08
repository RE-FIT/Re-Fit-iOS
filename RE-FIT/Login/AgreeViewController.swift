//
//  AgreeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 8/07/23.
//

import UIKit

class AgreeViewController: UIViewController {
    
    @IBOutlet weak var AgreeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AgreeView.layer.cornerRadius = 10
        AgreeView.clipsToBounds = true
    }

    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false)
    }
}

//
//  CompleteClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class CompleteClothesViewController: UIViewController {

    @IBOutlet weak var SelectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SelectView.layer.cornerRadius = 10
        SelectView.layer.masksToBounds = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

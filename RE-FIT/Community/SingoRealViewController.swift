//
//  SingoRealViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 30/07/23.
//

import UIKit

class SingoRealViewController: UIViewController {
    
    @IBOutlet weak var NotWantView: UIView!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotWantView.layer.cornerRadius = 10
        NotWantView.layer.masksToBounds = true
        
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

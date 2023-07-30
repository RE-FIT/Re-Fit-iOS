//
//  SingoAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 30/07/23.
//

import UIKit

class SingoAlertViewController: UIViewController {
    
    
    @IBOutlet weak var SingoView: UIView!
    
    @IBOutlet weak var YesButton: UIButton!
    
    @IBOutlet weak var NoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SingoView.layer.cornerRadius = 10
        SingoView.layer.masksToBounds = true
        
        YesButton.layer.cornerRadius = 10
        YesButton.layer.masksToBounds = true
        NoButton.layer.cornerRadius = 10
        NoButton.layer.borderWidth = 1
        NoButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
    }
    
    @IBAction func NextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WritingSingoVC") as? WritingSingoViewController else { return }
        
        self.present(nextVC, animated: false)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

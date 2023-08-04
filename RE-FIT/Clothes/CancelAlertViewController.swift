//
//  CancelAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 4/08/23.
//

import UIKit

class CancelAlertViewController: UIViewController {
    
    @IBOutlet weak var CancelView: UIView!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CancelView.layer.cornerRadius = 10
        CancelView.layer.masksToBounds = true
        
        YesButton.layer.cornerRadius = 10
        YesButton.layer.masksToBounds = true
        NoButton.layer.cornerRadius = 10
        NoButton.layer.borderWidth = 1
        NoButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func YesButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("DismissDetailView10"), object: nil, userInfo: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

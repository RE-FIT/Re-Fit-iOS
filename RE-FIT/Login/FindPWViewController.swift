//
//  FindPWViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 12/07/23.
//

import UIKit

class FindPWViewController: UIViewController {
    
    @IBOutlet weak var MailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MailView.layer.cornerRadius = self.MailView.frame.size.height / 2
        MailView.layer.masksToBounds = true
        MailView.clipsToBounds = true
    }
}

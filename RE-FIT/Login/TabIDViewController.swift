//
//  TabIDViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 11/07/23.
//

import UIKit

class TabIDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func FindButton(_ sender: Any) {
        guard let svc1 = self.storyboard?.instantiateViewController(identifier: "FindIDVC") as? FindIDViewController else {
            return
        }
        svc1.modalPresentationStyle = .overFullScreen
        self.present(svc1, animated: false)
    }
}

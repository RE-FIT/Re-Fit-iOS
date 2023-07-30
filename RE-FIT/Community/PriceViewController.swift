//
//  PriceViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 27/07/23.
//

import UIKit

class PriceViewController: UIViewController {
    
    @IBOutlet weak var PriceView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        PriceView.layer.cornerRadius = 20
        PriceView.layer.masksToBounds = false
        PriceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

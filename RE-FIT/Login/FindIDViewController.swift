//
//  FindIDViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 12/07/23.
//

import UIKit

class FindIDViewController: UIViewController {
    
    @IBOutlet weak var IDView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        IDView.layer.cornerRadius = 10
        IDView.clipsToBounds = true
    }
}

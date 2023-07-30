//
//  SingoCompleteViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 31/07/23.
//

import UIKit

class SingoCompleteViewController: UIViewController {

    @IBOutlet weak var SingoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SingoView.layer.cornerRadius = 10
        SingoView.layer.masksToBounds = true
        SingoView.layer.borderWidth = 2
        SingoView.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor
    }

}

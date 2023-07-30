//
//  WritingSingoEtcViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 31/07/23.
//

import UIKit

class WritingSingoEtcViewController: UIViewController {
    
    @IBOutlet weak var SingoTextView: UITextView!
    @IBOutlet weak var NotViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SingoTextView.layer.cornerRadius = 5
        SingoTextView.layer.masksToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

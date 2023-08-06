//
//  NoAccountAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class NoAccountAlertViewController: UIViewController {
    
    @IBOutlet weak var AlertView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AlertView.layer.cornerRadius = 5
        AlertView.layer.borderWidth = 1
        AlertView.layer.borderColor = UIColor(red: 206/255, green: 3/255, blue: 27/255, alpha: 1).cgColor
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

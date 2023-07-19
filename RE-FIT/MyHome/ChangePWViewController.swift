//
//  ChangePWViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit

class ChangePWViewController: UIViewController {
    
    @IBOutlet weak var InfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        InfoView.layer.cornerRadius = 10
        InfoView.clipsToBounds = true
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

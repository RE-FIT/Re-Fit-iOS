//
//  SettingsViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        View1.layer.cornerRadius = 10
        View1.clipsToBounds = true
        View2.layer.cornerRadius = 10
        View2.clipsToBounds = true
        View3.layer.cornerRadius = 10
        View3.clipsToBounds = true
        View4.layer.cornerRadius = 10
        View4.clipsToBounds = true
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

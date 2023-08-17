//
//  StartPageViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 8/08/23.
//

import UIKit

class StartPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoMockUp(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MockUpOneVC") as? MockUpOneViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func Login_Tapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func Find_IDPW(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "FindVC") as? FindViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func Join_Tapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

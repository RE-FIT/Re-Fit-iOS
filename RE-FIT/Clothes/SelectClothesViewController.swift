//
//  SelectClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class SelectClothesViewController: UIViewController {

    @IBOutlet weak var SelectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SelectView.layer.cornerRadius = 10
        SelectView.layer.masksToBounds = true
    }

    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func Wear_Today(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TreeVC") as? TreeViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)
    }
}

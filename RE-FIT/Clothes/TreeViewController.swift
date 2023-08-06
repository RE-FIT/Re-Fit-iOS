//
//  TreeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class TreeViewController: UIViewController {
    
    @IBOutlet weak var TreeCV: UICollectionView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var ClothImage: UIImageView!
    @IBOutlet weak var GoalView: UIView!
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 48, bottom: 30, right: 48)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopView.layer.cornerRadius = 40
        TopView.layer.masksToBounds = false
        TopView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        ClothImage.layer.cornerRadius = 15
        ClothImage.layer.masksToBounds = true
        
        GoalView.layer.cornerRadius = 15
        GoalView.layer.masksToBounds = true

        self.TreeCV.delegate = self
        self.TreeCV.dataSource = self
    }

    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

//
//  MyLikeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit

class MyLikeViewController: UIViewController {
    
    @IBOutlet weak var LikeSC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        LikeSC.removeBorders()
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        LikeSC.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        LikeSC.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
}

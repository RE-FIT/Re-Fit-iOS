//
//  MyLikeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit

class MyLikeViewController: UIViewController {
    
    @IBOutlet weak var LikeSC: UISegmentedControl!
    @IBOutlet weak var SellView: UIView!
    @IBOutlet weak var ShareView: UIView!
    
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
        
        SellView.alpha = 1
        ShareView.alpha = 0
    }
    
    @IBAction func Segment_Tapped(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            SellView.alpha = 1
            ShareView.alpha = 0
        }
        else if (sender as AnyObject).selectedSegmentIndex == 1 {
            SellView.alpha = 0
            ShareView.alpha = 1
        }
    }
}

//
//  MyFeedViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit

class MyFeedViewController: UIViewController {
    
    @IBOutlet weak var FeedSC: UISegmentedControl!
    @IBOutlet weak var SellView: UIView!
    @IBOutlet weak var ShareView: UIView!
    @IBOutlet weak var BuyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        FeedSC.removeBorders()
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        FeedSC.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        FeedSC.setTitleTextAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        
        SellView.alpha = 1
        ShareView.alpha = 0
        BuyView.alpha = 0
    }
    
    @IBAction func ChangeSegment(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            SellView.alpha = 1
            ShareView.alpha = 0
            BuyView.alpha = 0
        }
        else if (sender as AnyObject).selectedSegmentIndex == 1 {
            SellView.alpha = 0
            ShareView.alpha = 1
            BuyView.alpha = 0
        }
        else if (sender as AnyObject).selectedSegmentIndex == 2 {
            SellView.alpha = 0
            ShareView.alpha = 0
            BuyView.alpha = 1
        }
    }
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: .white), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.white), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

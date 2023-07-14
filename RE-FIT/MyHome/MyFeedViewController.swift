//
//  MyFeedViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit
import BetterSegmentedControl

class MyFeedViewController: UIViewController {
    
    @IBOutlet weak var FeedSC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        FeedSC.removeBorders()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        FeedSC.setTitleTextAttributes(titleTextAttributes, for:.normal)

        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        FeedSC.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        let font = UIFont.systemFont(ofSize: 16)
        FeedSC.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
    }
    
    @IBAction func ChangeSegment(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
            view.backgroundColor = .red
        }
        else if (sender as AnyObject).selectedSegmentIndex == 1 {
            view.backgroundColor = .orange
        }
        else if (sender as AnyObject).selectedSegmentIndex == 2 {
            view.backgroundColor = .black
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

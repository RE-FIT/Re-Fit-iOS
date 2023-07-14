//
//  MyHomeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import UIKit

class MyHomeViewController: UIViewController {
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var ProfileView: UIView!
    @IBOutlet weak var DayView: UIView!
    @IBOutlet weak var Day1: UIView!
    @IBOutlet weak var Day2: UIView!
    @IBOutlet weak var Day3: UIView!
    @IBOutlet weak var Day4: UIView!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var FeedView: UIView!
    @IBOutlet weak var LikeView: UIView!
    @IBOutlet weak var SettingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TopView.layer.cornerRadius = 30
        TopView.layer.masksToBounds = false
        TopView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        ProfileView.layer.cornerRadius = self.ProfileView.frame.size.height / 2
        ProfileView.layer.masksToBounds = true
        ProfileView.clipsToBounds = true
        
        DayView.layer.cornerRadius = 10
        DayView.clipsToBounds = true
        
        Day1.layer.cornerRadius = 5
        Day1.clipsToBounds = true
        Day2.layer.cornerRadius = 5
        Day2.clipsToBounds = true
        Day3.layer.cornerRadius = 5
        Day3.clipsToBounds = true
        Day4.layer.cornerRadius = 5
        Day4.clipsToBounds = true
        
        InfoView.layer.cornerRadius = 5
        InfoView.clipsToBounds = true
        FeedView.layer.cornerRadius = 5
        FeedView.clipsToBounds = true
        LikeView.layer.cornerRadius = 5
        LikeView.clipsToBounds = true
        SettingView.layer.cornerRadius = 5
        SettingView.clipsToBounds = true
    }
    
    @IBAction func InfoTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyInfoVC") as? MyInfoViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func FeedTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyFeedVC") as? MyFeedViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func LikeTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyLikeVC") as? MyLikeViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func SettingTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

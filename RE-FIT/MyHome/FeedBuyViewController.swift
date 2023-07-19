//
//  FeedBuyViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 19/07/23.
//

import UIKit

class FeedBuyViewController: UIViewController {
    
    @IBOutlet weak var BuyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BuyTableView.rowHeight = UITableView.automaticDimension
        BuyTableView.estimatedRowHeight = UITableView.automaticDimension
        
        BuyTableView.delegate = self
        BuyTableView.dataSource = self
        BuyTableView.layer.masksToBounds = true// any value you want
        BuyTableView.layer.shadowOpacity = 0.12// any value you want
        BuyTableView.layer.shadowRadius = 10 // any value you want
        BuyTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
}

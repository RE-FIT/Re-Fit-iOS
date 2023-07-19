//
//  FeedSellViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 19/07/23.
//

import UIKit

class FeedSellViewController: UIViewController {
    
    @IBOutlet weak var SellTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SellTableView.rowHeight = UITableView.automaticDimension
        SellTableView.estimatedRowHeight = UITableView.automaticDimension
        
        SellTableView.delegate = self
        SellTableView.dataSource = self
        SellTableView.layer.masksToBounds = true// any value you want
        SellTableView.layer.shadowOpacity = 0.12// any value you want
        SellTableView.layer.shadowRadius = 10 // any value you want
        SellTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
}

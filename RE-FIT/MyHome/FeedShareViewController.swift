//
//  FeedShareViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 19/07/23.
//

import UIKit

class FeedShareViewController: UIViewController {
    
    @IBOutlet weak var ShareTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShareTableView.rowHeight = UITableView.automaticDimension
        ShareTableView.estimatedRowHeight = UITableView.automaticDimension
        
        ShareTableView.delegate = self
        ShareTableView.dataSource = self
        ShareTableView.layer.masksToBounds = true// any value you want
        ShareTableView.layer.shadowOpacity = 0.12// any value you want
        ShareTableView.layer.shadowRadius = 10 // any value you want
        ShareTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
}

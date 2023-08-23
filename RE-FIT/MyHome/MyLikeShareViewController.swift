//
//  MyLikeShareViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 23/08/23.
//

import UIKit

class MyLikeShareViewController: UIViewController {
    
    @IBOutlet weak var MyShareTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MyShareTableView.rowHeight = UITableView.automaticDimension
        MyShareTableView.estimatedRowHeight = UITableView.automaticDimension
        
        MyShareTableView.delegate = self
        MyShareTableView.dataSource = self
        MyShareTableView.layer.masksToBounds = true// any value you want
        MyShareTableView.layer.shadowOpacity = 0.12// any value you want
        MyShareTableView.layer.shadowRadius = 10 // any value you want
        MyShareTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
}

//
//  MyLikeSellViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 23/08/23.
//

import UIKit

class MyLikeSellViewController: UIViewController {
    
    @IBOutlet weak var MySellTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MySellTableView.rowHeight = UITableView.automaticDimension
        MySellTableView.estimatedRowHeight = UITableView.automaticDimension
        
        MySellTableView.delegate = self
        MySellTableView.dataSource = self
        MySellTableView.layer.masksToBounds = true// any value you want
        MySellTableView.layer.shadowOpacity = 0.12// any value you want
        MySellTableView.layer.shadowRadius = 10 // any value you want
        MySellTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
}

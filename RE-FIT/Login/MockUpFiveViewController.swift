//
//  MockUpFiveViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 8/08/23.
//

import UIKit

class MockUpFiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeRecognizer()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(named: "BackgroundColor")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGestureRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
        
    @objc func respondToSwipeGestureRight(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                // 스와이프 시, 원하는 기능 구현.
                self.navigationController?.popViewController(animated: true)
            default: break
            }
        }
    }

    @IBAction func Go_Refit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

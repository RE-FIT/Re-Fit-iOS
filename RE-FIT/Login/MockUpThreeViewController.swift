//
//  MockUpThreeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 8/08/23.
//

import UIKit

class MockUpThreeViewController: UIViewController {

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
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGestureLeft(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
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
    
    @objc func respondToSwipeGestureLeft(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                // 스와이프 시, 원하는 기능 구현.
                guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MockUpFourVC") as? MockUpFourViewController else {return}
                
                self.navigationController?.pushViewController(rvc, animated: true)
            default: break
            }
        }
    }
    
    @IBAction func Skip_Tapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MockUpFiveVC") as? MockUpFiveViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

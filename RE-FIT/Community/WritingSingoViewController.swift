//
//  WritingSingoViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 30/07/23.
//

import UIKit

class WritingSingoViewController: UIViewController {
    
    @IBOutlet weak var NoSellButton: UIButton!
    @IBOutlet weak var NotButton: UIButton!
    @IBOutlet weak var SellerButton: UIButton!
    @IBOutlet weak var FraudButton: UIButton!
    @IBOutlet weak var EtcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func NextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SingoCompleteVC") as? SingoCompleteViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)// 만약 이 코드를 실행시키는 곳이 ViewController가 아니라면 임의로 뷰 컨트롤러를 설정해서 present하자.
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { _ in nextVC.dismiss(animated: false)} )
    }
}

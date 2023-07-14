//
//  InfoTabViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 13/07/23.
//

import UIKit
import Tabman
import Pageboy

class InfoTabViewController: TabmanViewController {
    
    @IBOutlet weak var TabView: UIView!
    
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabMan()
    }
        
    private func setupTabMan(){
        let vc1 = UIStoryboard.init(name: "MyHome", bundle: nil).instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileViewController
        let vc2 = UIStoryboard.init(name: "MyHome", bundle: nil).instantiateViewController(withIdentifier: "ChangePWVC") as! ChangePWViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        // 배경 회색으로 나옴 -> 하얀색으로 바뀜
        bar.backgroundView.style = .clear
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        // 버튼 글씨 커스텀
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            button.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        }

        
        bar.layout.contentMode = .fit
        
        // 밑줄 쳐지는 부분
        bar.indicator.weight = .custom(value: 4)
        bar.indicator.tintColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
        addBar(bar, dataSource: self, at: .custom(view: TabView, layout: nil))
    }
}

extension InfoTabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "회원정보 수정")
        case 1:
            return TMBarItem(title: "비밀번호 변경")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

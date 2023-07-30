//
//  ShareWritingUserViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 30/07/23.
//

import UIKit
import DropDown

class ShareWritingUserViewController: UIViewController {
    
    @IBOutlet weak var SingoButton: UIButton!
    @IBOutlet weak var ShareUserView: UIView!
    @IBOutlet weak var ShareUserCV: UICollectionView!
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var LikeButton: UIButton!
    
    let dropdown = DropDown()
    
    let Kind = [" 신고하기 ", " 이 사용자의 글 보지 않기 "]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        ShareUserView.layer.cornerRadius = 10
        ShareUserView.layer.masksToBounds = true
        DetailView.layer.cornerRadius = 10
        DetailView.layer.masksToBounds = true
        
        self.ShareUserCV.delegate = self
        self.ShareUserCV.dataSource = self
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        initUI()
        setDropdown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initUI() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.white // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.darkGray // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.darkGray // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func setDropdown() {
        // dataSource로 ItemList를 연결
        dropdown.dataSource = Kind
        dropdown.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdown.anchorView = self.SingoButton
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown.bottomOffset = CGPoint(x: -30, y: SingoButton.bounds.height)
        
        // Item 선택 시 처리
        dropdown.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            if index == 0 {
                guard let nextVC = self?.storyboard?.instantiateViewController(withIdentifier: "SingoAlertVC") as? SingoAlertViewController else { return }
                nextVC.modalPresentationStyle = .overFullScreen
                self?.present(nextVC, animated: false)
            } else if index == 1 {
                guard let nextVC = self?.storyboard?.instantiateViewController(withIdentifier: "SingoRealVC") as? SingoRealViewController else { return }
                nextVC.modalPresentationStyle = .overFullScreen
                self?.present(nextVC, animated: false)
            }
        }
        
        // 취소 시 처리
        dropdown.cancelAction = { [weak self] in
        }
    }
    
    @IBAction func Like_Tapped(_ sender: Any) {
        if (LikeButton.image(for: .selected) == UIImage(named: "Community_Like_Icon")) {
            LikeButton.isSelected = false
            LikeButton.setImage(UIImage(named: "Community_Like"), for: .normal)
            LikeButton.setImage(UIImage(named: "Community_Like"), for: .selected)
            LikeButton.tintColor = .clear
        } else {
            LikeButton.isSelected = true
            LikeButton.setImage(UIImage(named: "Community_Like_Icon"), for: .selected)
            LikeButton.tintColor = .clear
        }
    }
    
    @IBAction func Singo_Tapped(_ sender: Any) {
        dropdown.show()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

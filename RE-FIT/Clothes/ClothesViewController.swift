//
//  ClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import UIKit
import DropDown

class ClothesViewController: UIViewController {
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottomView: UIView!
    @IBOutlet weak var OuterView: UIView!
    @IBOutlet weak var OnepieceView: UIView!
    @IBOutlet weak var ShoeView: UIView!
    @IBOutlet weak var TopButton: UIButton!
    @IBOutlet weak var BottomButton: UIButton!
    @IBOutlet weak var OuterButton: UIButton!
    @IBOutlet weak var OnepieceButton: UIButton!
    @IBOutlet weak var ShoeButton: UIButton!
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var BottomLabel: UILabel!
    @IBOutlet weak var OuterLabel: UILabel!
    @IBOutlet weak var OnepieceLabel: UILabel!
    @IBOutlet weak var ShoeLabel: UILabel!
    @IBOutlet weak var SeasonTextField: UITextField!
    @IBOutlet weak var SortTextField: UITextField!
    @IBOutlet weak var ClothesCV: UICollectionView!
    
    let dropdownSeason = DropDown()
    let dropdownSort = DropDown()
    
    let Season = [" 봄 • 가을", " 여름", " 겨울"]
    let Sort = [" D-Day 순", " 많이 입은 순", " 적게 입은 순"]
    
    let sectionInsets = UIEdgeInsets(top: 0, left: 18, bottom: 18, right: 18)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SeasonTextField.layer.cornerRadius = 10
        SeasonTextField.layer.borderColor = UIColor.white.cgColor
        SeasonTextField.layer.borderWidth = 1.0
        SeasonTextField.layer.masksToBounds = true
        SortTextField.layer.cornerRadius = 10
        SortTextField.layer.borderColor = UIColor.white.cgColor
        SortTextField.layer.borderWidth = 1.0
        SortTextField.layer.masksToBounds = true
        
        SeasonTextField.isEnabled = false
        SortTextField.isEnabled = false
        
        TopView.layer.cornerRadius = self.TopView.frame.size.height / 2
        TopView.layer.masksToBounds = true
        TopView.clipsToBounds = true
        BottomView.layer.cornerRadius = self.BottomView.frame.size.height / 2
        BottomView.layer.masksToBounds = true
        BottomView.clipsToBounds = true
        OuterView.layer.cornerRadius = self.OuterView.frame.size.height / 2
        OuterView.layer.masksToBounds = true
        OuterView.clipsToBounds = true
        OnepieceView.layer.cornerRadius = self.OnepieceView.frame.size.height / 2
        OnepieceView.layer.masksToBounds = true
        OnepieceView.clipsToBounds = true
        ShoeView.layer.cornerRadius = self.ShoeView.frame.size.height / 2
        ShoeView.layer.masksToBounds = true
        ShoeView.clipsToBounds = true
        
        self.ClothesCV.delegate = self
        self.ClothesCV.dataSource = self

        initUISeason()
        initUISort()
        setDropdownSeason()
        setDropdownSort()
    }
    
    func initUISeason() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownSeason.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 11) ?? UIFont.systemFont(ofSize: 11)
    }
    
    func initUISort() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownSort.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 11) ?? UIFont.systemFont(ofSize: 11)
    }
    
    func setDropdownSeason() {
        // dataSource로 ItemList를 연결
        dropdownSeason.dataSource = Season
        dropdownSeason.cellHeight = 27
        // anchorView를 통해 UI와 연결
        dropdownSeason.anchorView = self.SeasonTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownSeason.bottomOffset = CGPoint(x: 0, y: SeasonTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownSeason.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.SeasonTextField.text = " \(item)"
        }
        
        // 취소 시 처리
        dropdownSeason.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownSort() {
        // dataSource로 ItemList를 연결
        dropdownSort.dataSource = Sort
        dropdownSort.cellHeight = 27
        // anchorView를 통해 UI와 연결
        dropdownSort.anchorView = self.SortTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownSort.bottomOffset = CGPoint(x: 0, y: SortTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownSort.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.SortTextField.text = " \(item)"
        }
        
        // 취소 시 처리
        dropdownSort.cancelAction = { [weak self] in
        }
    }
    
    @IBAction func Season_Tapped(_ sender: Any) {
        dropdownSeason.show()
    }
    
    @IBAction func Sort_Tapped(_ sender: Any) {
        dropdownSort.show()
    }
    
    @IBAction func Enroll_Clothes(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EnrollClothesVC") as? EnrollClothesViewController else { return }

        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}

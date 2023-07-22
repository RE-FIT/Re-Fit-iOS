//
//  CommunityViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import UIKit
import DropDown

class CommunityViewController: UIViewController {
    
    @IBOutlet weak var TypeTextField: UITextField!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var CategoryTextField: UITextField!
    @IBOutlet weak var CommuTableView: UITableView!
    @IBOutlet weak var WriteButton: UIButton!
    
    let dropdownType = DropDown()
    let dropdownGender = DropDown()
    let dropdownCategory = DropDown()
    
    let Kind = ["나눔", "판매"]
    let Gender = ["남성복", " 여성복"]
    let Category = ["상의", "하의", "아우터", "원피스", "신발", "액세서리"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TypeTextField.layer.cornerRadius = 15
        TypeTextField.layer.borderColor = UIColor.white.cgColor
        TypeTextField.layer.borderWidth = 1.0
        TypeTextField.layer.masksToBounds = true
        GenderTextField.layer.cornerRadius = 15
        GenderTextField.layer.borderColor = UIColor.white.cgColor
        GenderTextField.layer.borderWidth = 1.0
        GenderTextField.layer.masksToBounds = true
        CategoryTextField.layer.cornerRadius = 15
        CategoryTextField.layer.borderColor = UIColor.white.cgColor
        CategoryTextField.layer.borderWidth = 1.0
        CategoryTextField.layer.masksToBounds = true
        
        WriteButton.layer.cornerRadius = 10
        WriteButton.layer.masksToBounds = true
        
        TypeTextField.isEnabled = false
        GenderTextField.isEnabled = false
        CategoryTextField.isEnabled = false
        
        initUIType()
        initUIGender()
        initUICategory()
        setDropdownType()
        setDropdownGender()
        setDropdownCategory()
        
        CommuTableView.rowHeight = UITableView.automaticDimension
        CommuTableView.estimatedRowHeight = UITableView.automaticDimension
        
        CommuTableView.delegate = self
        CommuTableView.dataSource = self
        CommuTableView.layer.masksToBounds = true// any value you want
        CommuTableView.layer.shadowOpacity = 0.12// any value you want
        CommuTableView.layer.shadowRadius = 10 // any value you want
        CommuTableView.layer.shadowOffset = .init(width: 5, height: 10)
    }
    
    func initUIType() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(15)
        dropdownType.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUIGender() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(15)
        dropdownGender.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUICategory() {
        DropDown.appearance().textColor = UIColor.white // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(15)
        dropdownCategory.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func setDropdownType() {
        // dataSource로 ItemList를 연결
        dropdownType.dataSource = Kind
        dropdownType.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownType.anchorView = self.TypeTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownType.bottomOffset = CGPoint(x: 0, y: TypeTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownType.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.TypeTextField.text = " \(item)"
        }
        
        // 취소 시 처리
        dropdownType.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownGender() {
        // dataSource로 ItemList를 연결
        dropdownGender.dataSource = Gender
        dropdownGender.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownGender.anchorView = self.GenderTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownGender.bottomOffset = CGPoint(x: 0, y: GenderTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownGender.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.GenderTextField.text = " \(item)"
        }
        
        // 취소 시 처리
        dropdownGender.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownCategory() {
        // dataSource로 ItemList를 연결
        dropdownCategory.dataSource = Category
        dropdownCategory.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownCategory.anchorView = self.CategoryTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownCategory.bottomOffset = CGPoint(x: 0, y: CategoryTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownCategory.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.CategoryTextField.text = " \(item)"
        }
        
        // 취소 시 처리
        dropdownCategory.cancelAction = { [weak self] in
        }
    }
    
    @IBAction func Type_Tapped(_ sender: Any) {
        dropdownType.show()
    }
    
    @IBAction func Gender_Tapped(_ sender: Any) {
        dropdownGender.show()
    }
    
    @IBAction func Category_Tapped(_ sender: Any) {
        dropdownCategory.show()
    }
}

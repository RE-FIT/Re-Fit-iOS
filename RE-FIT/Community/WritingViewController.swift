//
//  WritingViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 26/07/23.
//

import UIKit
import DropDown

class WritingViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var PicView1: UIImageView!
    @IBOutlet weak var PicView2: UIImageView!
    @IBOutlet weak var PicView3: UIImageView!
    @IBOutlet weak var PicView4: UIImageView!
    @IBOutlet weak var PicView5: UIImageView!
    @IBOutlet weak var PicButton1: UIButton!
    @IBOutlet weak var PicButton2: UIButton!
    @IBOutlet weak var PicButton3: UIButton!
    @IBOutlet weak var PicButton4: UIButton!
    @IBOutlet weak var PicButton5: UIButton!
    @IBOutlet weak var PicLabel1: UILabel!
    @IBOutlet weak var PicLabel2: UILabel!
    @IBOutlet weak var PicLabel3: UILabel!
    @IBOutlet weak var PicLabel4: UILabel!
    @IBOutlet weak var PicLabel5: UILabel!
    @IBOutlet weak var ProductTextField: UITextField!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var CategoryTextField: UITextField!
    @IBOutlet weak var SizeTextField: UITextField!
    @IBOutlet weak var HowTextField: UITextField!
    @IBOutlet weak var PriceTextField: UITextField!
    @IBOutlet weak var DetailTextView: UITextView!
    
    @IBOutlet weak var HowView: UIStackView!
    @IBOutlet weak var HopeView: UIStackView!
    
    @IBOutlet weak var ShareButton: UIButton!
    @IBOutlet weak var SellButton: UIButton!
    
    
    let dropdownGender = DropDown()
    let dropdownCategory = DropDown()
    let dropdownSize = DropDown()
    let dropdownHow = DropDown()
    
    let Gender = [" 남성복", " 여성복"]
    let Category = [" 상의", " 하의", " 아우터", " 원피스", " 신발", " 액세서리"]
    let Size = [" XS", " S", " M", " L", " XL"]
    let How = [" 직거래", " 배송"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PriceTextField.isHidden = true
        HopeView.isHidden = true
        
        PicView1.layer.cornerRadius = 10
        PicView1.layer.masksToBounds = true
        PicView2.layer.cornerRadius = 10
        PicView2.layer.masksToBounds = true
        PicView3.layer.cornerRadius = 10
        PicView3.layer.masksToBounds = true
        PicView4.layer.cornerRadius = 10
        PicView4.layer.masksToBounds = true
        PicView5.layer.cornerRadius = 10
        PicView5.layer.masksToBounds = true
        
        ProductTextField.layer.cornerRadius = 10
        ProductTextField.layer.borderColor = UIColor.white.cgColor
        ProductTextField.layer.borderWidth = 1.0
        ProductTextField.layer.masksToBounds = true
        GenderTextField.layer.cornerRadius = 10
        GenderTextField.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1.0).cgColor
        GenderTextField.layer.borderWidth = 1.0
        GenderTextField.layer.masksToBounds = true
        CategoryTextField.layer.cornerRadius = 10
        CategoryTextField.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1.0).cgColor
        CategoryTextField.layer.borderWidth = 1.0
        CategoryTextField.layer.masksToBounds = true
        SizeTextField.layer.cornerRadius = 10
        SizeTextField.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1.0).cgColor
        SizeTextField.layer.borderWidth = 1.0
        SizeTextField.layer.masksToBounds = true
        HowTextField.layer.cornerRadius = 10
        HowTextField.layer.borderColor = UIColor.white.cgColor
        HowTextField.layer.borderWidth = 1.0
        HowTextField.layer.masksToBounds = true
        PriceTextField.layer.cornerRadius = 10
        PriceTextField.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1.0).cgColor
        PriceTextField.layer.borderWidth = 1.0
        PriceTextField.layer.masksToBounds = true
        DetailTextView.layer.cornerRadius = 10
        DetailTextView.layer.borderColor = UIColor.white.cgColor
        DetailTextView.layer.borderWidth = 1.0
        DetailTextView.layer.masksToBounds = true
        placeholderSetting()
        let attrString = NSMutableAttributedString(string: DetailTextView.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        textViewDidBeginEditing(DetailTextView)
        textViewDidEndEditing(DetailTextView)
        DetailTextView.textContainerInset = UIEdgeInsets(top: 14, left: 10, bottom: 14, right: 10)
        
        GenderTextField.isEnabled = false
        CategoryTextField.isEnabled = false
        SizeTextField.isEnabled = false
        HowTextField.isEnabled = false
        
        ShareButton.layer.cornerRadius = 15
        ShareButton.layer.masksToBounds = true
        SellButton.layer.cornerRadius = 15
        SellButton.layer.masksToBounds = true
        
        initUIGender()
        initUICategory()
        initUISize()
        initUIHow()
        setDropdownGender()
        setDropdownCategory()
        setDropdownSize()
        setDropdownHow()
    }
    
    @IBAction func Share_Tapped(_ sender: Any) {
        if (ShareButton.configuration?.baseForegroundColor == UIColor.white) {
            ShareButton.isSelected = false
            ShareButton.configuration?.baseForegroundColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0)
            ShareButton.backgroundColor = UIColor.white
            ShareButton.tintColor = .clear
        } else {
            ShareButton.isSelected = true
            ShareButton.configuration?.baseForegroundColor = UIColor.white
            ShareButton.backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            ShareButton.tintColor = .clear
        }
    }
    
    @IBAction func Sell_Tapped(_ sender: Any) {
        if (SellButton.configuration?.baseForegroundColor == UIColor.white) {
            SellButton.isSelected = false
            SellButton.configuration?.baseForegroundColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0)
            SellButton.backgroundColor = UIColor.white
            SellButton.tintColor = .clear
        } else {
            SellButton.isSelected = true
            SellButton.configuration?.baseForegroundColor = UIColor.white
            SellButton.backgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            SellButton.tintColor = .clear
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
        // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "                                                                                                    옷과 자신의 키 등에 대한 정보를 상세하게                                              적을수록 많은 분들이 관심을 가지니,                                                    최대한 자세하게 작성 부탁드려요:)                                                 (판매 금지 물품은 게시가 제한될 수 있음을 알립니다)"
            textView.textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0)
        }
        textView.layer.borderColor = UIColor.white.cgColor
    }
    
    func placeholderSetting() {
        DetailTextView.delegate = self
        DetailTextView.text = "                                                                                                    옷과 자신의 키 등에 대한 정보를 상세하게                                              적을수록 많은 분들이 관심을 가지니,                                                    최대한 자세하게 작성 부탁드려요:)                                                 (판매 금지 물품은 게시가 제한될 수 있음을 알립니다)"
        DetailTextView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12.0)
        DetailTextView.textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0)
    }
    
    func initUIGender() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownGender.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUICategory() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownCategory.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUISize() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownSize.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUIHow() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 111/255, alpha: 1.0) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1) // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownHow.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
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
            self!.GenderTextField.textColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            self!.GenderTextField.layer.borderColor = UIColor.white.cgColor
            self!.GenderTextField.layer.borderWidth = 1.0
            self!.GenderTextField.layer.masksToBounds = true
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
            self!.CategoryTextField.textColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            self!.CategoryTextField.layer.borderColor = UIColor.white.cgColor
            self!.CategoryTextField.layer.borderWidth = 1.0
            self!.CategoryTextField.layer.masksToBounds = true
        }
        
        // 취소 시 처리
        dropdownCategory.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownSize() {
        // dataSource로 ItemList를 연결
        dropdownSize.dataSource = Size
        dropdownSize.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownSize.anchorView = self.SizeTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownSize.bottomOffset = CGPoint(x: 0, y: SizeTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownSize.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.SizeTextField.text = " \(item)"
            self!.SizeTextField.textColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            self!.SizeTextField.layer.borderColor = UIColor.white.cgColor
            self!.SizeTextField.layer.borderWidth = 1.0
            self!.SizeTextField.layer.masksToBounds = true
        }
        
        // 취소 시 처리
        dropdownSize.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownHow() {
        // dataSource로 ItemList를 연결
        dropdownHow.dataSource = How
        dropdownHow.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownHow.anchorView = self.HowTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownHow.bottomOffset = CGPoint(x: 0, y: HowTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownHow.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.HowTextField.text = " \(item)"
            self!.HowTextField.textColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1)
            self!.HowTextField.layer.borderColor = UIColor.white.cgColor
            self!.HowTextField.layer.borderWidth = 1.0
            self!.HowTextField.layer.masksToBounds = true
        }
        
        // 취소 시 처리
        dropdownHow.cancelAction = { [weak self] in
        }
    }
    
    @IBAction func Gender_Tapped(_ sender: Any) {
        dropdownGender.show()
    }
    
    @IBAction func Category_Tapped(_ sender: Any) {
        dropdownCategory.show()
    }
    
    @IBAction func Size_Tapped(_ sender: Any) {
        dropdownSize.show()
    }
    
    @IBAction func How_Tapped(_ sender: Any) {
        dropdownHow.show()
    }

    @IBAction func Insert_Price(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PriceVC") as? PriceViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)
    }
}

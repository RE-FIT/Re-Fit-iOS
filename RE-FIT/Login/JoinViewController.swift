//
//  JoinViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 7/07/23.
//

import Foundation
import UIKit
import DropDown

class JoinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var EyeButton: UIButton!
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var BDTextField: UITextField!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var CheckButton: UIButton!
    
    let dropdown = DropDown()
    
    let Gender = [" 남자", " 여자"]
    
    var EmailData: EmailresultModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        IDTextField.layer.cornerRadius = 5
        IDTextField.layer.borderColor = UIColor.white.cgColor
        IDTextField.layer.borderWidth = 1.0
        IDTextField.layer.masksToBounds = true
        PWTextField.layer.cornerRadius = 5
        PWTextField.layer.borderColor = UIColor.white.cgColor
        PWTextField.layer.borderWidth = 1.0
        PWTextField.layer.masksToBounds = true
        EmailTextField.layer.cornerRadius = 5
        EmailTextField.layer.borderColor = UIColor.white.cgColor
        EmailTextField.layer.borderWidth = 1.0
        EmailTextField.layer.masksToBounds = true
        NameTextField.layer.cornerRadius = 5
        NameTextField.layer.borderColor = UIColor.white.cgColor
        NameTextField.layer.borderWidth = 1.0
        NameTextField.layer.masksToBounds = true
        BDTextField.layer.cornerRadius = 5
        BDTextField.layer.borderColor = UIColor.white.cgColor
        BDTextField.layer.borderWidth = 1.0
        BDTextField.layer.masksToBounds = true
        GenderTextField.layer.cornerRadius = 5
        GenderTextField.layer.borderColor = UIColor.white.cgColor
        GenderTextField.layer.borderWidth = 1.0
        GenderTextField.layer.masksToBounds = true
        
        IDTextField.delegate = self
        PWTextField.delegate = self
        EmailTextField.delegate = self
        NameTextField.delegate = self
        BDTextField.delegate = self
        GenderTextField.delegate = self
        textFieldDidBeginEditing(IDTextField)
        textFieldDidBeginEditing(PWTextField)
        textFieldDidBeginEditing(EmailTextField)
        textFieldDidBeginEditing(NameTextField)
        textFieldDidBeginEditing(BDTextField)
        textFieldDidBeginEditing(GenderTextField)
        textFieldDidEndEditing(GenderTextField)
        textFieldDidEndEditing(IDTextField)
        textFieldDidEndEditing(PWTextField)
        textFieldDidEndEditing(EmailTextField)
        textFieldDidEndEditing(NameTextField)
        textFieldDidEndEditing(BDTextField)
        
        GenderTextField.isEnabled = false
        
        initUI()
        setDropdown()
    }
    
    func initUI() {
        DropDown.appearance().textColor = UIColor.darkGray // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.white // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(5)
            dropdown.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func setDropdown() {
        // dataSource로 ItemList를 연결
        dropdown.dataSource = Gender
        dropdown.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdown.anchorView = self.GenderTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdown.bottomOffset = CGPoint(x: 0, y: GenderTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdown.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.GenderTextField.text = " \(item)"
            self!.GenderTextField.layer.borderColor = UIColor.clear.cgColor
            self!.GenderTextField.layer.cornerRadius = 5
            self!.GenderTextField.layer.borderWidth = 1.0
        }
        
        // 취소 시 처리
        dropdown.cancelAction = { [weak self] in
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor//your color
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
    }
    
    @IBAction func SelectGender(_ sender: Any) {
        GenderTextField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor//your color
        GenderTextField.layer.cornerRadius = 5
        GenderTextField.layer.borderWidth = 1.0
        dropdown.show()
    }
    
    @IBAction func ShowAgree(_ sender: Any) {
        guard let svc1 = self.storyboard?.instantiateViewController(identifier: "AgreeVC") as? AgreeViewController else {
            return
        }
        svc1.modalPresentationStyle = .overFullScreen
        self.present(svc1, animated: false)
    }
    
    @IBAction func ShowPassword(_ sender: Any) {
        PWTextField.isSecureTextEntry.toggle()
        EyeButton.isSelected.toggle()
        let eyeImage = EyeButton.isSelected ? "Eye_Icon2" : "Eye_Icon"
        EyeButton.setImage(UIImage(named: eyeImage), for: .normal)
        EyeButton.tintColor = .clear
    }
    
    @IBAction func EmailPostTapped(_ sender: Any) {
        let parameterDatas = EmailModel(email: EmailTextField.text ?? "")
        APIHandlerEmailPost.instance.SendingPostEmail(parameters: parameterDatas) { result in self.EmailData = result }
    }
    
    @IBAction func CheckTapped(_ sender: Any) {
        CheckButton.isSelected.toggle()
        let checkImage = CheckButton.isSelected ? "Check_Icon2" : "Check_Icon"
        CheckButton.setImage(UIImage(named: checkImage), for: .normal)
        CheckButton.tintColor = .clear
    }
}

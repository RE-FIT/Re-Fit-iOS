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
    @IBOutlet weak var NumberTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var BDTextField: UITextField!
    @IBOutlet weak var GenderTextField: UITextField!
    @IBOutlet weak var CheckButton: UIButton!
    @IBOutlet weak var IdentifyButton: UIButton!
    @IBOutlet weak var DuplicateButton: UIButton!
    @IBOutlet weak var certification: UIButton!
    @IBOutlet weak var NumberView: UIStackView!
    @IBOutlet weak var idTestLabel: UILabel!
    @IBOutlet weak var pwTestLabel: UILabel!
    @IBOutlet weak var emailTestLabel: UILabel!
    @IBOutlet weak var numberTestLabel: UILabel!
    @IBOutlet weak var nameTestLabel: UILabel!
    @IBOutlet weak var bdTestLabel: UILabel!
    @IBOutlet weak var JoinButton: UIButton!
    
    let dropdown = DropDown()
    
    let Gender = [" 남자", " 여자"]
    
    var Sexuality: Int = 0
    
    var EmailData: EmailresultModel!
    var CheckNameData: CheckNameresultModel!
    var JoinData: UserJoinresultModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        NumberView.isHidden = true
        
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
        
        certification.layer.cornerRadius = 5
        certification.layer.masksToBounds = true
        certification.isEnabled = false
        IdentifyButton.layer.cornerRadius = 5
        IdentifyButton.layer.masksToBounds = true
        IdentifyButton.isEnabled = false
        DuplicateButton.layer.cornerRadius = 5
        DuplicateButton.layer.masksToBounds = true
        DuplicateButton.isEnabled = false
        
        IDTextField.delegate = self
        PWTextField.delegate = self
        EmailTextField.delegate = self
        NameTextField.delegate = self
        BDTextField.delegate = self
        GenderTextField.delegate = self
        textFieldDidBeginEditing(IDTextField)
        textFieldDidBeginEditing(PWTextField)
        textFieldDidBeginEditing(EmailTextField)
        textFieldDidBeginEditing(NumberTextField)
        textFieldDidBeginEditing(NameTextField)
        textFieldDidBeginEditing(BDTextField)
        textFieldDidBeginEditing(GenderTextField)
        textFieldDidEndEditing(GenderTextField)
        textFieldDidEndEditing(IDTextField)
        textFieldDidEndEditing(PWTextField)
        textFieldDidEndEditing(EmailTextField)
        textFieldDidEndEditing(NumberTextField)
        textFieldDidEndEditing(NameTextField)
        textFieldDidEndEditing(BDTextField)
        
        IDTextField.addTarget(self, action: #selector(IDRegex(_:)), for: .editingChanged)
        PWTextField.addTarget(self, action: #selector(PWRegex(_:)), for: .editingChanged)
        EmailTextField.addTarget(self, action: #selector(EmailRegex(_:)), for: .editingChanged)
        BDTextField.addTarget(self, action: #selector(BirthRegex(_:)), for: .editingChanged)
        NumberTextField.addTarget(self, action: #selector(NumberRegex(_:)), for: .editingChanged)
        NameTextField.addTarget(self, action: #selector(NameRegex(_:)), for: .editingChanged)
        
        IDTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        PWTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        EmailTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        NumberTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        NameTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        BDTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        GenderTextField.addTarget(self, action: #selector(Join_Enabled(_:)), for: .editingChanged)
        
        GenderTextField.isEnabled = false
        
        JoinButton.isEnabled = false
        
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
            if index == 0 {
                self?.Sexuality = 0
            } else if index == 1 {
                self?.Sexuality = 1
            }
        }
        
        // 취소 시 처리
        dropdown.cancelAction = { [weak self] in
        }
    }
    
    @objc func IDRegex(_ textField: UITextField) {
        if isValidID(testStr: textField.text) {
            idTestLabel.text = "* 사용 가능한 아이디입니다."
            idTestLabel.textColor = UIColor(named: "MainColor")
        }
        else {
            IDTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            idTestLabel.text = "* 8-16자의 영문, 숫자를 포함해야 합니다."
            idTestLabel.textColor = UIColor(named: "RedColor")
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func PWRegex(_ textField: UITextField) {
        
        if isValidPW(testStr: textField.text) {
            pwTestLabel.text = "* 사용 가능 (안전도 등급 높음)"
            pwTestLabel.textColor = UIColor(named: "MainColor")
        }
        else {
            PWTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            pwTestLabel.text = "* 8-16자의 영문 대소문자, 숫자, 특수문자 ((!), (_) , (-))를 포함해야 합니다."
            pwTestLabel.textColor = UIColor(named: "RedColor")
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func EmailRegex(_ textField: UITextField) {
        
        if isValidEmail(testStr: textField.text) {
            emailTestLabel.text = "* 사용가능한 이메일 입니다."
            emailTestLabel.textColor = UIColor(named: "MainColor")
            certification.isEnabled = true
            certification.backgroundColor = UIColor(named: "MainColor")
            certification.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            EmailTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            emailTestLabel.text = "* 이메일 형식이 올바르지 않습니다."
            emailTestLabel.textColor = UIColor(named: "RedColor")
            certification.isEnabled = false
            certification.backgroundColor = UIColor(named: "GrayColor")
            certification.setTitleColor(UIColor.black, for: .normal)
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func BirthRegex(_ textField: UITextField) {
        
        if isValidBirth(testStr: textField.text) {
            bdTestLabel.text = ""
            bdTestLabel.textColor = UIColor(named: "MainColor")
        }
        else {
            BDTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            bdTestLabel.text = "* YYYY/MM/DD 형식으로 작성해야 합니다."
            bdTestLabel.textColor = UIColor(named: "RedColor")
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func NumberRegex(_ textField: UITextField) {
        
        if (textField.text?.count ?? 0 >= 8) {
            IdentifyButton.isEnabled = true
            IdentifyButton.backgroundColor = UIColor(named: "MainColor")
            IdentifyButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            IdentifyButton.isEnabled = false
            IdentifyButton.backgroundColor = UIColor(named: "GrayColor")
            IdentifyButton.setTitleColor(UIColor.black, for: .normal)
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func NameRegex(_ textField: UITextField) {
        
        if (textField.text?.count ?? 0 >= 1 && textField.text?.count ?? 0 <= 8) {
            DuplicateButton.isEnabled = true
            DuplicateButton.backgroundColor = UIColor(named: "MainColor")
            DuplicateButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            DuplicateButton.isEnabled = false
            DuplicateButton.backgroundColor = UIColor(named: "GrayColor")
            DuplicateButton.setTitleColor(UIColor.black, for: .normal)
        }
        
        UIView.animate(withDuration: 0.1) { // 효과 주기
                self.view.layoutIfNeeded()
        }
    }
    
    @objc func Join_Enabled(_ textField: UITextField) {
        if ((isValidID(testStr: IDTextField.text)) && (isValidPW(testStr: PWTextField.text)) && (isValidBirth(testStr: BDTextField.text)) && (isValidEmail(testStr: EmailTextField.text)) && (NumberTextField.isEnabled == false) && (NameTextField.isEnabled == false) && (GenderTextField.text?.isEmpty == false)) {
            JoinButton.isEnabled = true
        } else {
            JoinButton.isEnabled = false
        }
    }
    
    // 아이디 정규표현식
    func isValidID(testStr: String?) -> Bool{
        let regex = "[A-Za-z0-9]{8,16}"
        
        let idTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return idTest.evaluate(with: testStr)
    }
    
    // 비밀번호 정규표현식
    func isValidPW(testStr: String?) -> Bool{
        let regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,16}$"
        
        let pwTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return pwTest.evaluate(with: testStr)
    }
    
    // 이메일 정규표현식
    func isValidEmail(testStr: String?) -> Bool{
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailTest.evaluate(with: testStr)
    }
    
    // 생년월일 정규표현식
    func isValidBirth(testStr: String?) -> Bool{
        let regex = "([0-9]{4})+/([0-9]{2})+/([0-9]{2})"
        
        let birthTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return birthTest.evaluate(with: testStr)
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
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
        NumberView.isHidden = false
    }
    
    @IBAction func Number_Checked(_ sender: Any) {
        if (NumberTextField.text == EmailData.code) {
            NumberTextField.isEnabled = false
            IdentifyButton.isEnabled = false
            IdentifyButton.backgroundColor = UIColor(named: "GrayColor")
            IdentifyButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            NumberTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            numberTestLabel.text = "* 인증번호를 다시 한번 확인해주세요."
            numberTestLabel.textColor = UIColor(named: "RedColor")
        }
    }
    
    @IBAction func CheckTapped(_ sender: Any) {
        CheckButton.isSelected.toggle()
        let checkImage = CheckButton.isSelected ? "Check_Icon2" : "Check_Icon"
        CheckButton.setImage(UIImage(named: checkImage), for: .normal)
        CheckButton.tintColor = .clear
    }
    
    @IBAction func Dupliacte_Tapped(_ sender: Any) {
        let parameterDatas = CheckNameModel(name: NameTextField.text ?? "")
        APIHandlerCheckNamePost.instance.SendingPostCheckName(parameters: parameterDatas) { result in self.CheckNameData = result }
        if (CheckNameData.code == "10020") {
            NameTextField.isEnabled = false
            nameTestLabel.text = "* 사용가능한 닉네임 입니다."
        } else {
            NameTextField.layer.borderColor = UIColor(named: "RedColor")?.cgColor
            nameTestLabel.text = "* 이미 존재하는 닉네임입니다."
        }
    }
    
    @IBAction func JoinButton(_ sender: Any) {
        let parameterDatas =  UserJoinModel(loginId: IDTextField.text ?? "", password: PWTextField.text ?? "", email: EmailTextField.text ?? "", name: NameTextField.text ?? "", birth: BDTextField.text ?? "", gender: Sexuality)
        APIHandlerUserJoinPost.instance.SendingPostUserJoin(parameters: parameterDatas) { result in self.JoinData = result }
    }
}

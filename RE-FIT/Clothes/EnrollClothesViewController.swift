//
//  EnrollClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 3/08/23.
//

import UIKit
import DropDown

class EnrollClothesViewController: UIViewController, SampleProtocol2 {
    
    @IBOutlet weak var ClothesImage: UIImageView!
    
    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var BottomLabel: UILabel!
    @IBOutlet weak var OuterLabel: UILabel!
    @IBOutlet weak var OnepieceLabel: UILabel!
    @IBOutlet weak var ShoeLabel: UILabel!
    @IBOutlet weak var TopButton: UIButton!
    @IBOutlet weak var BottomButton: UIButton!
    @IBOutlet weak var OuterButton: UIButton!
    @IBOutlet weak var OnepieceButton: UIButton!
    @IBOutlet weak var ShoeButton: UIButton!
    
    @IBOutlet weak var SeasonView: UIView!
    @IBOutlet weak var SpringFall: UIButton!
    @IBOutlet weak var Summer: UIButton!
    @IBOutlet weak var Winter: UIButton!
    
    @IBOutlet weak var PlanView: UIView!
    @IBOutlet weak var YesButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    @IBOutlet weak var AlarmView: UIView!
    @IBOutlet weak var GoalView: UIView!
    @IBOutlet weak var RecommendView: UIView!
    @IBOutlet weak var MonthTextField: UITextField!
    @IBOutlet weak var NumbersTextField: UITextField!
    @IBOutlet weak var EnrollButton: UIButton!
    @IBOutlet weak var EnrollLabel: UILabel!
    
    @IBOutlet weak var MonthButton: UIButton!
    @IBOutlet weak var NumberButton: UIButton!
    
    let dropdownMonth = DropDown()
    let dropdownNumbers = DropDown()
    
    let Month = [" 1개월", " 2개월", " 3개월"]
    let Numbers1 = [" 5", " 10", " 15", " 20", " 25", " 30"]
    let Numbers2 = [" 10", " 20", " 30", " 40", " 50", " 60"]
    let Numbers3 = [" 10", " 20", " 30", " 40", " 50", " 60", " 70", " 80", " 90"]
    
    func imageSend(data: UIImage) {
        ClothesImage.image = data
    }
    
    func deleteButton() {
        EnrollButton.isHidden = true
        EnrollLabel.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlanView.isHidden = true
        AlarmView.isHidden = true
        GoalView.isHidden = true
        RecommendView.isHidden = true
        
        ClothesImage.layer.cornerRadius = 10
        ClothesImage.layer.masksToBounds = true

        CategoryView.layer.cornerRadius = 10
        CategoryView.layer.masksToBounds = true
        SeasonView.layer.cornerRadius = 10
        SeasonView.layer.masksToBounds = true
        PlanView.layer.cornerRadius = 10
        PlanView.layer.masksToBounds = true
        AlarmView.layer.cornerRadius = 10
        AlarmView.layer.masksToBounds = true
        GoalView.layer.cornerRadius = 10
        GoalView.layer.masksToBounds = true
        RecommendView.layer.cornerRadius = 10
        RecommendView.layer.masksToBounds = true
        
        TopButton.layer.cornerRadius = 10
        TopButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        TopButton.layer.borderWidth = 1.0
        TopButton.layer.masksToBounds = true
        BottomButton.layer.cornerRadius = 10
        BottomButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        BottomButton.layer.borderWidth = 1.0
        BottomButton.layer.masksToBounds = true
        OuterButton.layer.cornerRadius = 10
        OuterButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        OuterButton.layer.borderWidth = 1.0
        OuterButton.layer.masksToBounds = true
        OnepieceButton.layer.cornerRadius = 10
        OnepieceButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        OnepieceButton.layer.borderWidth = 1.0
        OnepieceButton.layer.masksToBounds = true
        ShoeButton.layer.cornerRadius = 10
        ShoeButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        ShoeButton.layer.borderWidth = 1.0
        ShoeButton.layer.masksToBounds = true
        
        SpringFall.layer.cornerRadius = 10
        SpringFall.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        SpringFall.layer.borderWidth = 1.0
        SpringFall.layer.masksToBounds = true
        Summer.layer.cornerRadius = 10
        Summer.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        Summer.layer.borderWidth = 1.0
        Summer.layer.masksToBounds = true
        Winter.layer.cornerRadius = 10
        Winter.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        Winter.layer.borderWidth = 1.0
        Winter.layer.masksToBounds = true
        changeDisableButtonColor(button: SpringFall, color: .white)
        changeDisableButtonColor(button: Summer, color: .white)
        changeDisableButtonColor(button: Winter, color: .white)
        
        YesButton.layer.cornerRadius = 10
        YesButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        YesButton.layer.borderWidth = 1.0
        YesButton.layer.masksToBounds = true
        NoButton.layer.cornerRadius = 10
        NoButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        NoButton.layer.borderWidth = 1.0
        NoButton.layer.masksToBounds = true
        
        MonthTextField.layer.cornerRadius = 10
        MonthTextField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor
        MonthTextField.layer.borderWidth = 1.0
        MonthTextField.layer.masksToBounds = true
        NumbersTextField.layer.cornerRadius = 10
        NumbersTextField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor
        NumbersTextField.layer.borderWidth = 1.0
        NumbersTextField.layer.masksToBounds = true
        
        NumberButton.isEnabled = false
        
        initUIMonth()
        initUINumbers()
        setDropdownMonth()
        setDropdownNumbers()
        
        NotificationCenter.default.addObserver(
                  self,
                  selector: #selector(self.didDismissDetailNotification(_:)),
                  name: NSNotification.Name("DismissDetailView10"),
                  object: nil
                  )
    }
    
    @objc func didDismissDetailNotification(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func changeDisableButtonColor(button: UIButton, color: UIColor) {
        let rect = CGRect(x: 0.0, y: 0.0, width: button.frame.width, height: button.frame.height)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        button.setBackgroundImage(image, for: .disabled)
    }
    
    func initUIMonth() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 11/255, alpha: 1) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor(red: 95/255, green: 102/255, blue: 11/255, alpha: 1) // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.white // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownMonth.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func initUINumbers() {
        DropDown.appearance().textColor = UIColor(red: 95/255, green: 102/255, blue: 11/255, alpha: 1) // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor(red: 95/255, green: 102/255, blue: 11/255, alpha: 1) // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor.white // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(10)
        dropdownNumbers.dismissMode = .automatic // 팝업을 닫을 모드 설정
        DropDown.appearance().textFont = UIFont(name: "AppleSDGothicNeo-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    func setDropdownMonth() {
        // dataSource로 ItemList를 연결
        dropdownMonth.dataSource = Month
        dropdownMonth.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownMonth.anchorView = self.MonthTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownMonth.bottomOffset = CGPoint(x: 0, y: MonthTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownMonth.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.MonthTextField.text = " \(item)"
            if index == 0 {
                self?.dropdownNumbers.dataSource = self!.Numbers1
                self?.NumberButton.isEnabled = true
            } else if index == 1 {
                self?.dropdownNumbers.dataSource = self!.Numbers2
                self?.NumberButton.isEnabled = true
            } else if index == 2 {
                self?.dropdownNumbers.dataSource = self!.Numbers3
                self?.NumberButton.isEnabled = true
            }
        }
        
        // 취소 시 처리
        dropdownMonth.cancelAction = { [weak self] in
        }
    }
    
    func setDropdownNumbers() {
        // dataSource로 ItemList를 연결
        dropdownNumbers.dataSource = Numbers1
        dropdownNumbers.cellHeight = 35
        // anchorView를 통해 UI와 연결
        dropdownNumbers.anchorView = self.NumbersTextField
        
        // View를 갖리지 않고 View아래에 Item 팝업이 붙도록 설정
        dropdownNumbers.bottomOffset = CGPoint(x: 0, y: NumbersTextField.bounds.height)
        
        // Item 선택 시 처리
        dropdownNumbers.selectionAction = { [weak self] (index, item) in
            //선택한 Item을 TextField에 넣어준다.
            self!.NumbersTextField.text = " \(item)"
            self?.RecommendView.isHidden = false
        }
        
        // 취소 시 처리
        dropdownNumbers.cancelAction = { [weak self] in
        }
    }
    
    @IBAction func Top_Tapped(_ sender: Any) {
        if TopButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            TopLabel.textColor = UIColor(named: "MainColor")
            TopButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        } else {
            TopLabel.textColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            TopButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        }
    }
    
    @IBAction func Bottom_Tapped(_ sender: Any) {
        if BottomButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            BottomLabel.textColor = UIColor(named: "MainColor")
            BottomButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        } else {
            BottomLabel.textColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            BottomButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        }
    }
    
    @IBAction func Outer_Tapped(_ sender: Any) {
        if OuterButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            OuterLabel.textColor = UIColor(named: "MainColor")
            OuterButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        } else {
            OuterLabel.textColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            OuterButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        }
    }
    
    @IBAction func Onepiece_Tapped(_ sender: Any) {
        if OnepieceButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            OnepieceLabel.textColor = UIColor(named: "MainColor")
            OnepieceButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        } else {
            OnepieceLabel.textColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            OnepieceButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        }
    }
    
    @IBAction func Shoe_Tapped(_ sender: Any) {
        if ShoeButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            ShoeLabel.textColor = UIColor(named: "MainColor")
            ShoeButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
        } else {
            ShoeLabel.textColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            ShoeButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        }
    }
    
    @IBAction func SpringFall_Tapped(_ sender: Any) {
        if SpringFall.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            SpringFall.configuration?.image = UIImage(named: "Select_Season")
            SpringFall.configuration?.baseForegroundColor = UIColor(named: "MainColor")
            SpringFall.layer.borderColor = UIColor(named: "MainColor")?.cgColor
            GoalView.isHidden = false
            Summer.isEnabled = false
            Summer.configuration?.baseBackgroundColor = .white
            Winter.isEnabled = false
            Winter.configuration?.baseBackgroundColor = .white
        } else {
            SpringFall.configuration?.image = UIImage(named: "Select_Season_Grey")
            SpringFall.configuration?.baseForegroundColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            SpringFall.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
            GoalView.isHidden = true
            Summer.isEnabled = true
            Winter.isEnabled = true
        }
    }
    
    @IBAction func Summer_Tapped(_ sender: Any) {
        if Summer.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            Summer.configuration?.image = UIImage(named: "Select_Season")
            Summer.configuration?.baseForegroundColor = UIColor(named: "MainColor")
            Summer.layer.borderColor = UIColor(named: "MainColor")?.cgColor
            PlanView.isHidden = false
            SpringFall.isEnabled = false
            Winter.isEnabled = false
        } else {
            Summer.configuration?.image = UIImage(named: "Select_Season_Grey")
            Summer.configuration?.baseForegroundColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            Summer.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
            PlanView.isHidden = true
            SpringFall.isEnabled = true
            Winter.isEnabled = true
        }
    }
    
    @IBAction func Winter_Tapped(_ sender: Any) {
        if Winter.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            Winter.configuration?.image = UIImage(named: "Select_Season")
            Winter.configuration?.baseForegroundColor = UIColor(named: "MainColor")
            Winter.layer.borderColor = UIColor(named: "MainColor")?.cgColor
            PlanView.isHidden = false
            SpringFall.isEnabled = false
            Summer.isEnabled = false
        } else {
            Winter.configuration?.image = UIImage(named: "Select_Season_Grey")
            Winter.configuration?.baseForegroundColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            Winter.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
            PlanView.isHidden = true
            SpringFall.isEnabled = true
            Summer.isEnabled = true
        }
    }
    
    @IBAction func Yes_Tapped(_ sender: Any) {
        if YesButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            YesButton.configuration?.image = UIImage(named: "Select_Season")
            YesButton.configuration?.baseForegroundColor = UIColor(named: "MainColor")
            YesButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
            GoalView.isHidden = false
            NoButton.isEnabled = false
        } else {
            YesButton.configuration?.image = UIImage(named: "Select_Season_Grey")
            YesButton.configuration?.baseForegroundColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            YesButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
            GoalView.isHidden = true
            NoButton.isEnabled = true
        }
    }
    
    @IBAction func No_Tapped(_ sender: Any) {
        if NoButton.layer.borderColor == UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor {
            NoButton.configuration?.image = UIImage(named: "Select_Season")
            NoButton.configuration?.baseForegroundColor = UIColor(named: "MainColor")
            NoButton.layer.borderColor = UIColor(named: "MainColor")?.cgColor
            AlarmView.isHidden = false
            YesButton.isEnabled = false
        } else {
            NoButton.configuration?.image = UIImage(named: "Select_Season_Grey")
            NoButton.configuration?.baseForegroundColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1)
            NoButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
            AlarmView.isHidden = true
            YesButton.isEnabled = true
        }
    }
    
    @IBAction func Enroll_Tapped(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ClothImageEnrollVC") as? ClothImageEnrollViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        nextVC.delegate = self
        self.present(nextVC, animated: false)
    }
    
    @IBAction func Month_Tapped(_ sender: Any) {
        dropdownMonth.show()
    }
    
    @IBAction func Numbers_Tapped(_ sender: Any) {
        dropdownNumbers.show()
    }
    
    @IBAction func backButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CancelAlertVC") as? CancelAlertViewController else { return }
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: false)
    }
}

//
//  EnrollClothesViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 3/08/23.
//

import UIKit
import DropDown

class EnrollClothesViewController: UIViewController {
    
    @IBOutlet weak var ClothesImage: UIImageView!
    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var SeasonView: UIView!
    @IBOutlet weak var PlanView: UIView!
    @IBOutlet weak var AlarmView: UIView!
    @IBOutlet weak var GoalView: UIView!
    @IBOutlet weak var RecommendView: UIView!
    @IBOutlet weak var MonthTextField: UITextField!
    @IBOutlet weak var NumbersTextField: UITextField!
    
    let dropdownMonth = DropDown()
    let dropdownNumbers = DropDown()
    
    let Month = [" 1개월", " 2개월", " 3개월"]
    let Numbers1 = [" 5", " 10", " 15", " 20", " 25", " 30"]
    let Numbers2 = [" 10", " 20", " 30", " 40", " 50", " 60"]
    let Numbers3 = [" 10", " 20", " 30", " 40", " 50", " 60", " 70", " 80", " 90"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        MonthTextField.layer.cornerRadius = 10
        MonthTextField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor
        MonthTextField.layer.borderWidth = 1.0
        MonthTextField.layer.masksToBounds = true
        NumbersTextField.layer.cornerRadius = 10
        NumbersTextField.layer.borderColor = UIColor(red: 36/255, green: 117/255, blue: 53/255, alpha: 1).cgColor
        NumbersTextField.layer.borderWidth = 1.0
        NumbersTextField.layer.masksToBounds = true
        
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
            self.navigationController?.popViewController(animated: true)
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
            } else if index == 1 {
                self?.dropdownNumbers.dataSource = self!.Numbers2
            } else if index == 2 {
                self?.dropdownNumbers.dataSource = self!.Numbers3
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
        }
        
        // 취소 시 처리
        dropdownNumbers.cancelAction = { [weak self] in
        }
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

//
//  LoginViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 7/07/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var EyeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        IDTextField.layer.cornerRadius = 5
        IDTextField.layer.borderWidth = 1
        IDTextField.layer.borderColor = UIColor.clear.cgColor
        PWTextField.layer.cornerRadius = 5
        PWTextField.layer.borderWidth = 1
        PWTextField.layer.borderColor = UIColor.clear.cgColor
        
        IDTextField.delegate = self
        PWTextField.delegate = self
        textFieldDidBeginEditing(IDTextField)
        textFieldDidBeginEditing(PWTextField)
        textFieldDidEndEditing(IDTextField)
        textFieldDidEndEditing(PWTextField)
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
    
    @IBAction func ShowPassword(_ sender: Any) {
        PWTextField.isSecureTextEntry.toggle()
        EyeButton.isSelected.toggle()
        let eyeImage = EyeButton.isSelected ? "Eye_Icon2" : "Eye_Icon"
        EyeButton.setImage(UIImage(named: eyeImage), for: .normal)
        EyeButton.tintColor = .clear
    }
    
    @IBAction func JoinButton(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC") as? JoinViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

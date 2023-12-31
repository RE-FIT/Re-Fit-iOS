//
//  ImageEnrollAlertViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 12/08/23.
//

import UIKit

protocol SampleProtocol:AnyObject {
    func imageSend(data: UIImage)
}

class ImageEnrollAlertViewController: UIViewController {

    @IBOutlet weak var EnrollView: UIView!
    @IBOutlet weak var AlbumButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!
    
    weak var delegate : SampleProtocol?
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnrollView.layer.cornerRadius = 10
        EnrollView.layer.masksToBounds = true
        
        AlbumButton.layer.cornerRadius = 10
        AlbumButton.layer.masksToBounds = true
        DeleteButton.layer.cornerRadius = 10
        DeleteButton.layer.borderWidth = 1
        DeleteButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        
        enrollAlertEvent()
        self.imagePickerController.delegate = self
    }

    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func Select_Album(_ sender: Any) {
        self.openAlbum()
    }
    
    @IBAction func Delete_Image(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("DismissDetailView2"), object: nil, userInfo: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    func enrollAlertEvent() {
        let photoLibraryAlertAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default) {
            (action) in
            self.openAlbum() // 아래에서 설명 예정.
        }
        
        let cameraAlertAction = UIAlertAction(title: "사진 촬영", style: .default) {
            (action) in
            self.openCamera() // 아래에서 설명 예정.
        }
    }
}

extension ImageEnrollAlertViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openAlbum() {
        self.imagePickerController.sourceType = .photoLibrary
        present(self.imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            delegate?.imageSend(data: image)
            self.dismiss(animated: false, completion: nil)
        } else {
            print("error detected in didFinishPickinMEdiaWithInfo method")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func openCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            self.imagePickerController.sourceType = .camera
            present(self.imagePickerController, animated: false, completion: nil)
        } else {
            print("Camera is not available as for now")
        }
    }
}

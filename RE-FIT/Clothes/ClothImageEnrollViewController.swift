//
//  ClothImageEnrollViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 20/08/23.
//

import UIKit

protocol SampleProtocol2:AnyObject {
    func imageSend(data: UIImage)
    func deleteButton()
}

class ClothImageEnrollViewController: UIViewController {
    
    @IBOutlet weak var EnrollView: UIView!
    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var AlbumButton: UIButton!
    
    weak var delegate : SampleProtocol2?
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EnrollView.layer.cornerRadius = 10
        EnrollView.layer.masksToBounds = true
        
        CameraButton.layer.cornerRadius = 10
        CameraButton.layer.masksToBounds = true
        AlbumButton.layer.cornerRadius = 10
        AlbumButton.layer.borderWidth = 1
        AlbumButton.layer.borderColor = UIColor(red: 168/255, green: 175/255, blue: 184/255, alpha: 1).cgColor
        
        enrollAlertEvent()
        self.imagePickerController.delegate = self
    }
    
    @IBAction func Camera_Tapped(_ sender: Any) {
        self.openCamera()
    }
    
    @IBAction func Album_Tapped(_ sender: Any) {
        self.openAlbum()
    }
    
    @IBAction func backButton(_ sender: Any) {
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

extension ClothImageEnrollViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openAlbum() {
        self.imagePickerController.sourceType = .photoLibrary
        present(self.imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            delegate?.imageSend(data: image)
            delegate?.deleteButton()
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

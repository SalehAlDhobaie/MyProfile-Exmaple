//
//  ViewController.swift
//  MyProfile-Exmaple
//
//  Created by Admin on 03/09/2018.
//  Copyright © 2018 SalehAlDhobaie. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userImageView.isUserInteractionEnabled = true
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageDidTapped(_:)))
        userImageView.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @objc func imageDidTapped(_ sender: UIImageView) {
        
        let alertController = UIAlertController(title: "Warning", message: "Do you want to change your image profile? ", preferredStyle: .actionSheet)
        
        let changePictureAction = UIAlertAction(title: "Change Image Profile", style: .default, handler: { [weak self] action in
            self?.showImagePicker(sender)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(changePictureAction)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func showImagePicker(_ sender: UIImageView) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
}



extension ProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.userImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

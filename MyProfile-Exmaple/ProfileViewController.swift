//
//  ViewController.swift
//  MyProfile-Exmaple
//
//  Created by Admin on 03/09/2018.
//  Copyright © 2018 SalehAlDhobaie. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // TODO: create IBOutlet from UIImageView class and link it from Storyboard.
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        
        /*
         * TODO: create Tap Gesture and add it to UserImageView, make sure `isUserInteractionEnabled` is true
         *
         */
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageDidTapped(_:)))
        userImageView.addGestureRecognizer(tapGesture)
        
        /*
         * Extra : you could make your image as rounded ImageView.
         *
         */
        
        userImageView.isUserInteractionEnabled = true
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     * TODO: create a function recived an action and show Alert to ask him if want to change picture or cancel. make sure when user tap on change to call another function to present `ImagePickerView`.
     *
     */
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


/*
 * TODO : Here please add and implement `UIImagePickerControllerDelegate` function in order to update userImageView. 
 *
 */
extension ProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.userImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

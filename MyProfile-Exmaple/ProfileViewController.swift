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
     * TODO: Create a function that receives an action and shows an alert to ask the user if they want to change the profile picture or to cancel the alert. Make sure to call another function to build and present `ImagePickerView`when the user taps on change.
     *
     */
    @objc func imageDidTapped(_ sender: UIImageView) {
        
        let alertController = UIAlertController(title: "Warning", message: "Do you want to change your image profile? ", preferredStyle: .actionSheet)
        
        let changePictureAction = UIAlertAction(title: "Change Image Profile", style: .default, handler: { [weak self] action in
            self?.showImagePicker(sender)
        })
        
        let shareProfileAction = UIAlertAction(title: "Share Profile", style: .default, handler: { [weak self] action in
            self?.shareFunction(sender)
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(changePictureAction)
        alertController.addAction(shareProfileAction)
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
    
    // TODO: please write share function will be call when user tap on Share option by calling `UIActivityViewController` class and attach any message with `userImageProfile`
    func shareFunction(_ sender: UIImageView) {
        let image = userImageView.image
        let items : [Any] = ["This is my profile info", image!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        
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

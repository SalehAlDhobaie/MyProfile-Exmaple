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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        
        /*
         * TODO: create Tap Gesture and add it to UserImageView, make sure `isUserInteractionEnabled` is true
         *
         */
        
        
        // Code here.
        
        
        /*
         * Extra : you could make your image as rounded ImageView.
         *
         */
        
        // Extra Code here
        
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

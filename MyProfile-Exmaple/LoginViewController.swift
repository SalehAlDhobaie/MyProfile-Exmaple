//
//  LoginViewController.swift
//  MyProfile-Exmaple
//
//  Created by Admin on 03/09/2018.
//  Copyright © 2018 SalehAlDhobaie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}



/*
 * TODO : Here please add and implement `UITextFieldDelegate` function in order to validate Username/Password. username should be 4+ chars, password should be 8 chars
 *
 */

extension LoginViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == usernameTextField {
            
            guard let text = textField.text else {
                return true
            }
            if text.count > 4 {
                textField.textColor = UIColor.green
            }else {
                textField.textColor = UIColor.red
            }
            
        }else if textField == passwordTextField {
            guard let text = textField.text else {
                return true
            }
            if text.count > 8 {
                textField.textColor = UIColor.green
            }else {
                textField.textColor = UIColor.red
            }
        }
        return true
    }
}



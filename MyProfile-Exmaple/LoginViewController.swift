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
    var isPasswordInputValid : Bool = false
    var isUserNameInputValid : Bool = false
    
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
        
        guard isPasswordInputValid && isUserNameInputValid else {
            showAlert()
            return
        }
        
        performSegue(withIdentifier: "toProfileViewController", sender: usernameTextField.text!)
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "Ypur input in Username or Password not matching the requiered input", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toProfileViewController", let nav = segue.destination as? UINavigationController,  let destination = nav.topViewController as? ProfileViewController {
            if let username = sender as? String {
                destination.userNameValue = username
            }
        }
    }
    
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
                isUserNameInputValid = true
                textField.textColor = UIColor.green
            }else {
                isUserNameInputValid = false
                textField.textColor = UIColor.red
            }
            
        }else if textField == passwordTextField {
            guard let text = textField.text else {
                return true
            }
            if text.count > 8 {
                isPasswordInputValid = true
                textField.textColor = UIColor.green
            }else {
                isPasswordInputValid = false
                textField.textColor = UIColor.red
            }
        }
        return true
    }
}



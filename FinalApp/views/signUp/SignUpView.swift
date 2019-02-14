//
//  SignUpView.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class SignUpView: UIView, Form {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordError: UILabel!
    
    var delegate: SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        resetFields()
    }
    
    func resetFields() {
        emailField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
        resetErrors()
    }
    
    func resetErrors() {
        emailError.text = ""
        passwordError.text = ""
        confirmPasswordError.text = ""
    }
    
    func validateFields() -> Bool {
        var isOk: Bool = true
        resetErrors()
        
        let _email = emailField.text ?? ""
        if _email.isEmpty {
            emailError.text = "Email empty !"
            isOk = false
        } else if !_email.isValidEmail() {
            emailError.text = "Email incorrect format !"
            isOk = false
        }
        
        let _password = passwordField.text ?? ""
        if _password.isEmpty {
            passwordError.text = "Password empty !"
            isOk = false
        }
        
        let _confPassword = confirmPasswordField.text ?? ""
        if _confPassword.isEmpty {
            confirmPasswordError.text = "Confirmation Password empty !"
            isOk = false
        }
        
        if isOk && _password != _confPassword {
            confirmPasswordError.text = "Passwords are not matching"
            isOk = false
        }
        
        return isOk
    }
    
    @IBAction func onSignUpPressed(_ sender: UIButton) {
        delegate?.onSignUpPressed()
    }
    
    @IBAction func onGoToSignInPressed(_ sender: UIButton) {
        delegate?.onGoToSignInPressed()
    }
}

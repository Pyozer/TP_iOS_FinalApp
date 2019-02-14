//
//  SignInView.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class SignInView: UIView, Form {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    
    var delegate: SignInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        resetFields()
    }
    
    func resetFields() {
        emailField.text = ""
        passwordField.text = ""
        resetErrors()
    }
    
    func resetErrors() {
        emailError.text = ""
        passwordError.text = ""
    }
    
    func validateFields() -> Bool {
        var isOk : Bool = true
        
        let _email : String = emailField.text ?? ""
        if _email.isEmpty {
            emailError.text = "Email empty !"
            isOk = false
        }
        
        let _password = passwordField.text ?? ""
        if _password.isEmpty {
            passwordError.text = "Password empty !"
            isOk = false
        }
        
        return isOk
    }
    
    @IBAction func onSignInPressed(_ sender: UIButton) {
        delegate?.onSignInPressed()
    }

    @IBAction func onGoToRegisterPressed(_ sender: UIButton) {
        delegate?.onGoToSignUpPressed()
    }
    
}

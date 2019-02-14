//
//  SignUpView.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
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
    }
    
    func resetFields() {
        emailField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
    }
    
    func validateFields() -> Bool {
        var isOk: Bool = true
        
        let _email = emailField.text ?? ""
        if _email.isEmpty {
            print("Email empty !")
            // TODO: Display message under email field
            isOk = false
        }
        
        let _password = passwordField.text ?? ""
        if _password.isEmpty {
            print("Password empty !")
            // TODO: Display message under password field
            isOk = false
        }
        
        let _confPassword = confirmPasswordField.text ?? ""
        if _confPassword.isEmpty {
            print("Confirmation Password empty !")
            // TODO: Display message under confirmation password field
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

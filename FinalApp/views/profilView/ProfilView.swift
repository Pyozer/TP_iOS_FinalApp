//
//  ProfilView.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class ProfilView: UIView, Form {
        
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var confirmNewPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordError: UILabel!
    
    @IBOutlet weak var playSnake: UIButton!

    var delegate: ProfilViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("ProfilView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        initView()
    }
    
    func initView() {
        userEmail.text = RegisteredUser.instance?.email
        resetFields()
    }
    
    func resetFields() {
        newPasswordField.text = ""
        confirmNewPasswordField.text = ""
        resetErrors()
    }
    
    func resetErrors() {
        passwordError.text = ""
        confirmPasswordError.text = ""
    }
    
    func validateFields() -> Bool {
        var isOk: Bool = true
        resetErrors()
        
        let _newPassword = newPasswordField.text ?? ""
        if _newPassword.isEmpty {
            passwordError.text = "New Password empty !"
            isOk = false
        }
        
        let _confNewPassword = confirmNewPasswordField.text ?? ""
        if _confNewPassword.isEmpty {
             confirmPasswordError.text = "Confirmation New Password empty !"
            isOk = false
        }
        
        if isOk && _newPassword != _confNewPassword {
            confirmPasswordError.text = "Passwords are not matching"
            isOk = false
        }
        
        return isOk
    }
    
    @IBAction func onChangePasswordPressed(_ sender: UIButton) {
        delegate?.onChangePassword()
    }
    
    @IBAction func onLogoutPressed(_ sender: UIButton) {
        delegate?.onLogout()
    }
    
    @IBAction func onPlaySnake(_ sender: UIButton) {
        delegate?.onPlaySnake()
    }
    
}

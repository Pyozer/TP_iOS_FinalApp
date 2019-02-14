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
    @IBOutlet weak var confirmNewPasswordField: UITextField!
    
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
    }
    
    func resetFields() {
        newPasswordField.text = ""
        confirmNewPasswordField.text = ""
    }
    
    func validateFields() -> Bool {
        var isOk: Bool = true
        
        let _newPassword = newPasswordField.text ?? ""
        if _newPassword.isEmpty {
            print("New Password empty !")
            // TODO: Display message under new password field
            isOk = false
        }
        
        let _confNewPassword = confirmNewPasswordField.text ?? ""
        if _confNewPassword.isEmpty {
            print("Confirmation New Password empty !")
            // TODO: Display message under confirmation new password field
            isOk = false
        }
        
        if !_newPassword.isEmpty && !_confNewPassword.isEmpty && _newPassword != _confNewPassword {
            print("Passwords are not matching")
            // TODO: Display message under confirmation new password field
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
}

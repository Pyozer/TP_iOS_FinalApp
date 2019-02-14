//
//  ViewController.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate, ProfilViewDelegate {

    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var profilView: ProfilView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.delegate = self
        signInView.delegate = self
        profilView.delegate = self
        
        showSignUp()
    }
    
    private func switchView(signIn: Bool = false, signUp: Bool = false, profil: Bool = false) {
        signUpView.isHidden = !signUp
        signInView.isHidden = !signIn
        profilView.isHidden = !profil
    }
    
    private func showSignUp() {
        switchView(signUp: true)
    }

    private func showSignIn() {
        switchView(signIn: true)
    }
    
    private func showProfil() {
        switchView(profil: true)
    }
    
    // Sign In
    func onSignInPressed() {
        if signInView.validateFields() {
            let email = signInView.emailField.text!
            let password = signInView.passwordField.text!
            
            let user: User? = RegisteredUser.instance
            if (user?.email ?? "") == email && (user?.password ?? "") == password {
                print("Successful Sign In")
                signInView.resetFields()
                showProfil()
            } else {
                print("Login failed !")
            }
        }
    }
    
    func onGoToSignUpPressed() {
        showSignUp()
    }
    
    // Sign Up
    func onSignUpPressed() {
        if signUpView.validateFields() {
            let email = signUpView.emailField.text!
            let password = signUpView.passwordField.text!
            RegisteredUser.setUser(user: User(email: email, password: password))
            print("Successful Sign Up", RegisteredUser.instance?.email)
            showProfil()
            signUpView.resetFields()
        }
    }
    
    func onGoToSignInPressed() {
        showSignIn()
    }
    
    // Profil View
    
    func onChangePassword() {
        if profilView.validateFields() {
            let newPassword = profilView.newPasswordField.text!
            RegisteredUser.instance?.password = newPassword
            print("Password successfully changed")
            profilView.resetFields()
            // TODO: Display message
        }
    }
    
    func onLogout() {
        switchView(signIn: true, signUp: false, profil: false)
    }

}


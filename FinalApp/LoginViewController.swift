//
//  ViewController.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate {

    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var signInView: SignInView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.delegate = self
        signInView.delegate = self
        showSignUp()
    }
    
    private func showSignUp() {
        signUpView.isHidden = false
        signInView.isHidden = true
    }

    private func showSignIn() {
        signUpView.isHidden = true
        signInView.isHidden = false
    }
    
    // Sign In
    func onSignInPressed() {
        let _email = signInView.emailField.text ?? ""
        if _email.isEmpty {
            print("Email empty !")
            // TODO: Display message under email field
        }
        
        let _password = signInView.passwordField.text ?? ""
        if _password.isEmpty {
            print("Password empty !")
            // TODO: Display message under password field
        }
        if !_email.isEmpty && !_password.isEmpty {
            RegisteredUser.setUser(user: User(email: _email, password: _password))
            print("Successful Sign In")
        }
    }
    
    func onGoToSignUpPressed() {
        showSignUp()
    }
    
    // Sign Up
    func onSignUpPressed() {
        let _email = signUpView.emailField.text ?? ""
        if _email.isEmpty {
            print("Email empty !")
            // TODO: Display message under email field
        }
        
        let _password = signUpView.passwordField.text ?? ""
        if _password.isEmpty {
            print("Password empty !")
            // TODO: Display message under password field
        }
        
        let _confPassword = signUpView.confirmPasswordField.text ?? ""
        if _confPassword.isEmpty {
            print("Confirmation Password empty !")
            // TODO: Display message under confirmation password field
        }
        
        if !_password.isEmpty && !_confPassword.isEmpty && _password != _confPassword {
            print("Passwords not equals !")
            // TODO: Display message under confirmation password field
        }
        
        if !_email.isEmpty && !_password.isEmpty && !_confPassword.isEmpty {
            RegisteredUser.setUser(user: User(email: _email, password: _password))
            print("Successful Sign Up")
        }
    }
    
    func onGoToSignInPressed() {
        showSignIn()
    }
    

}


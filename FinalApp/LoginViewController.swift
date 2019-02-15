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
        
        switchView(signUp: true)
    }
    
    private func switchView(signIn: Bool = false, signUp: Bool = false, profil: Bool = false) {
        signUpView.isHidden = !signUp
        signInView.isHidden = !signIn
        profilView.isHidden = !profil
    }
    
    private func showProfil() {
        profilView.initView()
        switchView(profil: true)
    }
    
    // Sign In
    func onSignInPressed() {
        if signInView.validateFields() {
            let email = signInView.emailField.text!
            let password = signInView.passwordField.text!
            
            let user: User? = RegisteredUser.instance
            if (user?.email ?? "") == email && (user?.password ?? "") == password {
                signInView.resetFields()
                showProfil()
            } else {
                showAlert("Error !", "Invalid credentials.")
            }
        }
    }
    
    func onGoToSignUpPressed() {
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: Date())
        if seconds > 55 {
            let calcController = self.storyboard?.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController
            self.present(calcController, animated: true, completion: nil)
        } else {
            switchView(signUp: true)
        }
    }
    
    // Sign Up
    func onSignUpPressed() {
        if signUpView.validateFields() {
            let email = signUpView.emailField.text!
            let password = signUpView.passwordField.text!
            RegisteredUser.setUser(user: User(email: email, password: password))
            showProfil()
            signUpView.resetFields()
        }
    }
    
    func onGoToSignInPressed() {
        switchView(signIn: true)
    }
    
    // Profil View
    
    func onChangePassword() {
        if profilView.validateFields() {
            let newPassword = profilView.newPasswordField.text!
            RegisteredUser.instance?.password = newPassword
            showAlert("Success !", "Password change is a success")
            profilView.resetFields()
        }
    }
    
    func onLogout() {
        switchView(signIn: true)
    }
    
    func onPlaySnake() {
        let customURL = URL(string: "snakegameschool://")!
        if UIApplication.shared.canOpenURL(customURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL)
            } else {
                UIApplication.shared.openURL(customURL)
            }
        } else {
            showAlert("App missing", "Snake Game is not installed !")
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

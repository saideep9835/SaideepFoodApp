//
//  SignInViewController.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import UIKit

class SignInViewController: UIViewController, OTPViewModelDelegate {
   
    @IBOutlet weak var oTPLabel: UILabel!
    @IBOutlet weak var oneTimePassTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    let signInModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInModel.delegate = self
        oTPLabel.isHidden = true

    }
    
    @IBAction func requestOTP(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else {
                    showAlert("Please enter your email")
                    return
                }
                
                // Ask ViewModel to generate OTP
        signInModel.generateOTP()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let enteredOTP = oneTimePassTF.text, !enteredOTP.isEmpty else {
                    showAlert("Please enter the OTP")
                    return
                }
                
                // Ask ViewModel to verify the entered OTP
        signInModel.verifyOTP(enteredOTP: enteredOTP)
    }
    
    func didGenerateOTP(_ otp: String) {
        oTPLabel.text = "Your OTP is: \(otp)"
        oTPLabel.isHidden = false
    }
    
    func didVerifyOTP(success: Bool) {
        if success {
            if let foodVC = self.storyboard?.instantiateViewController(withIdentifier: "FoodViewController") as? FoodViewController {
                        
        navigationController?.pushViewController(foodVC, animated: true)
        } else {
        print("Failed to instantiate FoodViewController")
                    }
    } else {
    showAlert("Invalid OTP. Please try again.")
                }
    }
    
    func showAlert(_ message: String) {
            let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

}

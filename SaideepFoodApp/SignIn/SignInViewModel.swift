//
//  SignInViewModel.swift
//  SaideepFoodApp
//
//  Created by Saideep Reddy Talusani on 9/18/24.
//

import Foundation

// Protocol to notify the ViewController when OTP is generated or verified
protocol OTPViewModelDelegate: AnyObject {
    func didGenerateOTP(_ otp: String)
    func didVerifyOTP(success: Bool)
}

class SignInViewModel {
    weak var delegate: OTPViewModelDelegate?
    
    private var generatedOTP: String?

   
    func generateOTP() {
        generatedOTP = String(format: "%06d", Int.random(in: 0...999999))
        
        
        if let otp = generatedOTP {
            delegate?.didGenerateOTP(otp)
        }
    }

  
    func verifyOTP(enteredOTP: String) {
        let isVerified = enteredOTP == generatedOTP
        delegate?.didVerifyOTP(success: isVerified)
    }
}


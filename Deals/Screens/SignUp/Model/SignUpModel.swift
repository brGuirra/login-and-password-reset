//
//  AppModel.swift
//  Deals
//
//  Created by Bruno Guirra on 30/04/22.
//

import Foundation


struct ValidationStatus {
    let error: Bool
    let message: String
}

struct SignUpModel {
    
    func isPasswordValid(_ password: String) {
       
//        if password.isEmpty {
//            let result = PasswordValidationResult(legthAndNoSpaceMet: true, uppercaseMet: true, lowercaseMet: true, digitMet: true, specialCharacterMet: true, error: (true, "Enter your password"))
//
//            return result
//        }
//
//        // Valid characters
//        let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
//        let invalidSet = CharacterSet(charactersIn: validChars).inverted
//        if password.rangeOfCharacter(from: invalidSet) != nil {
//            let result = ValidationStatus(error: true, message: "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
//
//            return result
//        }
//
//        let criteriaResult = isCriteriaMet(password)
//        let checkable = [criteriaResult.specialCharacterMet, criteriaResult.digitMet, criteriaResult.uppercaseMet, criteriaResult.lowercaseMet]
//        let metCriteria = checkable.filter { $0 }
//
//        if criteriaResult.legthAndNoSpaceMet && metCriteria.count >= 3 {
//            let result = ValidationStatus(error: false, message: "")
//
//            return result
//        } else {
//            let result = ValidationStatus(error: true, message: "Your password must meet the requirements below")
//
//            return result
//        }
    }
    
    func isCriteriaMet(_ password: String) -> PasswordCriteriaValidationResult {
        let lengthAndNoSpaceResult = PasswordCriteria.lengthAndNoSpaceMet(password)
        let uppercaseResult = PasswordCriteria.uppercaseMet(password)
        let lowercaseResult = PasswordCriteria.lowercaseMet(password)
        let digitResult = PasswordCriteria.digitMet(password)
        let specialCharacterResult = PasswordCriteria.specialCharacterMet(password)
        
        let result = PasswordCriteriaValidationResult(legthAndNoSpaceMet: lengthAndNoSpaceResult, uppercaseMet: uppercaseResult, lowercaseMet: lowercaseResult, digitMet: digitResult, specialCharacterMet: specialCharacterResult)
        
        return result
    }
}

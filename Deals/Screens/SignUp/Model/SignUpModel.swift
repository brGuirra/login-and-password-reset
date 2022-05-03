//
//  AppModel.swift
//  Deals
//
//  Created by Bruno Guirra on 30/04/22.
//

import Foundation

struct SignUpModel {
    
    func isPasswordValid(_ password: String) -> PasswordValidationResult {
       
        if password.isEmpty {
            let result = PasswordValidationResult(criteriaValidation: PasswordCriteriaValidationResult(legthAndNoSpaceMet: false, uppercaseMet: false, lowercaseMet: false, digitMet: false, specialCharacterMet: false), error: PasswordError(message: "Enter your password"))

            return result
        }
        
        let criteriaResult = isCriteriaMet(password)
        
        // Valid characters
        let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
        let invalidSet = CharacterSet(charactersIn: validChars).inverted
        if password.rangeOfCharacter(from: invalidSet) != nil {
            let result = PasswordValidationResult(criteriaValidation: criteriaResult, error: PasswordError(message: "Enter valid special chars .,@:?!()$\\/#) with no spaces"))

            return result
        }

        let checkable = [criteriaResult.specialCharacterMet, criteriaResult.digitMet, criteriaResult.uppercaseMet, criteriaResult.lowercaseMet]
        let metCriteria = checkable.filter { $0 }

        if criteriaResult.legthAndNoSpaceMet && metCriteria.count >= 3 {
            let result = PasswordValidationResult(criteriaValidation: criteriaResult, error: nil)
            
            return result
        } else {
            let result = PasswordValidationResult(criteriaValidation: criteriaResult, error: PasswordError(message: "Your password must meet the requirements below"))
            
            return result
        }
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

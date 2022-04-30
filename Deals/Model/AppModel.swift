//
//  AppModel.swift
//  Deals
//
//  Created by Bruno Guirra on 30/04/22.
//

import Foundation

struct AppModel {
    
    func isPasswordValid(_ password: String) -> PasswordValidationResult {
        let lengthAndNoSpaceResult = PasswordCriteria.lengthAndNoSpaceMet(password)
        let uppercaseResult = PasswordCriteria.uppercaseMet(password)
        let lowercaseResult = PasswordCriteria.lowercaseMet(password)
        let digitResult = PasswordCriteria.digitMet(password)
        let specialCharacterResult = PasswordCriteria.specialCharacterMet(password)
        
        let result = PasswordValidationResult(legthAndNoSpaceMet: lengthAndNoSpaceResult, uppercaseMet: uppercaseResult, lowercaseMet: lowercaseResult, digitMet: digitResult, specialCharacterMet: specialCharacterResult)
        
        return result
    }
}

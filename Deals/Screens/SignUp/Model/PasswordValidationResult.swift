//
//  PasswordValidation.swift
//  Deals
//
//  Created by Bruno Guirra on 02/05/22.
//

import Foundation

struct PasswordValidationResult {
    let criteriaValidation: PasswordCriteriaValidationResult
    let error: PasswordError?
}

struct PasswordError: Error {
    let message: String
}

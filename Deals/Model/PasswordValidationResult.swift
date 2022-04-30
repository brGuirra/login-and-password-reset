//
//  ValidationPasswordResult.swift
//  Deals
//
//  Created by Bruno Guirra on 30/04/22.
//

import Foundation

struct PasswordValidationResult {
    let legthAndNoSpaceMet: Bool
    let uppercaseMet: Bool
    let lowercaseMet: Bool
    let digitMet: Bool
    let specialCharacterMet: Bool
}

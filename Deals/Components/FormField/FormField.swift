//
//  FormField.swift
//  Deals
//
//  Created by Bruno Guirra on 02/05/22.
//

import UIKit

protocol FormFieldDelegate: AnyObject {
    
    func didStartTyping(_ sender: FormField, text: String?) -> Void
    
    func didFinishTyping(_ sender: FormField, text: String?) -> Void
}

class FormField: UIView {
    
    weak var delegate: FormFieldDelegate?
}

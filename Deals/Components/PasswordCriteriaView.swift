//
//  PasswordCriteriaView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

enum Status: String {
    case initial = "circle"
    case invalid = "xmark.circle"
    case valid = "checkmark.circle"
}

class PasswordCriteriaView: UIStackView {
    
    private let criteriaText: String
    
    private lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 16)
        let image = UIImage(systemName: Status.initial.rawValue, withConfiguration: config)
        
        imageView.image = image
        imageView.tintColor = .quaternaryLabel
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var criteriaTextLabel: UILabel = {
        let label = UILabel()
        
        label.text = criteriaText
        label.font = .preferredFont(forTextStyle: .footnote)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(criteriaText: String) {
        self.criteriaText = criteriaText
        
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout and Style

extension PasswordCriteriaView {
    
    private func setUp() {
        style()
        layout()
    }
    
    private func style() {
        self.axis = .horizontal
        self.spacing = 8
    }
    
    private func layout() {
        addArrangedSubview(statusImageView)
        addArrangedSubview(criteriaTextLabel)
    }
}

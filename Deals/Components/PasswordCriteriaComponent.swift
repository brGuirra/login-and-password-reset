//
//  PasswordCriteriaView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class PasswordCriteriaComponent: UIStackView {
    
    private let criteriaText: String
    
    private let circleImage = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
    
    private let checkmarkImage = UIImage(systemName: "checkmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
    
    private let xMarkImage = UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                statusImageView.image = checkmarkImage
                statusImageView.tintColor = .systemGreen
            } else {
                statusImageView.image = xMarkImage
                statusImageView.tintColor = .systemPink
            }
        }
    }
    
    private lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16))
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

extension PasswordCriteriaComponent {
    
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
    
    func reset() {
        statusImageView.image = circleImage
        statusImageView.tintColor = .quaternaryLabel
    }
}

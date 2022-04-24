//
//  HomeView.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func goToSignIn() -> Void
    func goToSignUp() -> Void
}

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var homeImageView: UIImageView = {
        let imageView = UIImageView()
        let homeImage = UIImage(named: "Home")
        
        imageView.image = homeImage
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var introStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.contentMode = .center
        stackView.axis = .vertical
        stackView.spacing = 16
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var introTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Get the best deals!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor(named: "SecondaryAccentColor")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var introText: UILabel = {
        let label = UILabel()
        
        label.text = "You don't have to search the hole internet to find them, we've already made this for you."
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = UIColor(named: "PrimaryTextColor")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let button = CustomButton(text: "Sign In", color: "SecondaryAccentColor")
    
        button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = CustomButton(text: "Sign Up", color: "PrimaryAccentColor")
        
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout and Style

extension HomeView {
    
    func setUp() {
        style()
        layout()
        configConstraints()
    }
    
    func style() {
        
    }
    
    func layout() {
        addSubview(homeImageView)
        
        introStackView.addArrangedSubview(introTitle)
        introStackView.addArrangedSubview(introText)
        addSubview(introStackView)
        
        addSubview(signInButton)
        addSubview(signUpButton)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            // Home Image
            homeImageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3),
            homeImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: homeImageView.trailingAnchor, multiplier: 3),
            
            // Intro
            introStackView.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: homeImageView.bottomAnchor, multiplier: 8),
            introStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 6),
            trailingAnchor.constraint(equalToSystemSpacingAfter: introStackView.trailingAnchor, multiplier: 6),
            
            // Sign In Button
            signInButton.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: introStackView.bottomAnchor, multiplier: 6),
            signInButton.leadingAnchor.constraint(equalTo: homeImageView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: homeImageView.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            
            // Sign Up Button
            signUpButton.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            signUpButton.leadingAnchor.constraint(equalTo: homeImageView.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: homeImageView.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}

//MARK: - Actions

extension HomeView {
    
    @objc func didTapSignIn() {
        delegate?.goToSignIn()
    }
    
    @objc func didTapSignUp() {
        delegate?.goToSignUp()
    }
}

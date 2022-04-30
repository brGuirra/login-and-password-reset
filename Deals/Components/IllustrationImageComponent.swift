//
//  IllustrationImageView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class IllustrationImageComponent: UIImageView {

    private let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
        
        super.init(frame: .zero)
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        image = UIImage(named: imageName)
        contentMode = .scaleAspectFit
    }
}


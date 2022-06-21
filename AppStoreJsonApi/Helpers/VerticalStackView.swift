//
//  VerticalStackView.swift
//  AppStoreJsonApi
//
//  Created by Ömer Faruk Kılıçaslan on 20.06.2022.
//

import UIKit

class VerticalStackView: UIStackView {

    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  HomeTitleImage.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class HomeTitleImage: UIImageView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.image = UIImage(resource: .posterImage6)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}

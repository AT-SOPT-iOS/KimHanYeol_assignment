//
//  UITextField+.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/16/25.
//

import UIKit

extension UITextField {
    func setPlaceholderColor(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

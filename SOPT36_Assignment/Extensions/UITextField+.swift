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
    
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func configureDefaultSettings() {
        self.autocorrectionType = .no           // 자동 수정 비활성화
        self.spellCheckingType = .no            // 맞춤법 검사 비활성화
        self.autocapitalizationType = .none     // 자동 대문자 비활성화
//        self.clearButtonMode = .always          // 입력내용 한번에 지우는 x버튼(오른쪽)
        self.clearsOnBeginEditing = false       // 편집 시 기존 텍스트필드값 초기화 안되게끔
    }
}

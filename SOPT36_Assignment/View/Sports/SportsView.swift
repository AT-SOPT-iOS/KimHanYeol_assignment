//
//  SportsViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class SportsView: UIView {
    private var label = UILabel().then {
        $0.text = "SportsViewController"
        $0.textAlignment = .center
        $0.textColor = .white
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(label)
    }
    
    func setLayout() {
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setStyle() {
        
    }
    

}

//
//  EntertainmentViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class EntertainmentView: BaseView {
    private var label = UILabel().then {
        $0.text = "EntertainmentViewController"
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
    
    override func setUI() {
        self.addSubview(label)
    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    override func setStyle() {
        
    }
    
}

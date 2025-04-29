//
//  DramaViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class DramaViewController: BaseUIViewController {
    private var label = UILabel().then {
        $0.text = "DramaViewController"
        $0.textAlignment = .center
        $0.textColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setStyle()
        setEvent()
    }
    
    override func setUI() {
        view.addSubview(label)
    }
    
    override func setLayout() {
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    override func setStyle() {
        
    }
    
    override func setEvent() {
        
    }
}

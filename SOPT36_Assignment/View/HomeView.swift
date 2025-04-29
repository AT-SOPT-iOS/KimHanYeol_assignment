//
//  HomeViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

final class HomeView: BaseView {
    private let titleImage = UIImageView()
    
    private var label = UILabel().then {
        $0.text = "NewsViewController"
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
        self.addSubviews(titleImage,label)
    }
    
    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {
        titleImage.do {
            $0.image = UIImage(resource: .posterImage6)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
}

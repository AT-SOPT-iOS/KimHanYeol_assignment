//
//  HomeViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    private let titleImage = HomeTitleImage()
    private let todayTopView = TodayTopView()

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
        self.addSubviews(titleImage, todayTopView)
    }
    
    override func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        todayTopView.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(10)
            $0.height.equalTo(250)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setStyle() {

    }
    
}

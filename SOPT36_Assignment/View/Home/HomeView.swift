//
//  HomeViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    private let titleImage = HomeTitleImage()
    private let todayTopView = TodayTopView()
    private let livePopularProgramView = LivePopularProgramView()
    private let livePopularMoviewView = LivePopularMoviewView()
    private let baseballLogoView = BaseballLogoView()
    private let logoView = LogoView()
    private let gahyunPick = GahyunPick()

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
        self.addSubviews(
            titleImage,
            todayTopView,
            livePopularProgramView,
            livePopularMoviewView,
            baseballLogoView,
            logoView,
            gahyunPick
        )
    }
    
    func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        todayTopView.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        livePopularProgramView.snp.makeConstraints {
            $0.top.equalTo(todayTopView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        livePopularMoviewView.snp.makeConstraints {
            $0.top.equalTo(livePopularProgramView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        baseballLogoView.snp.makeConstraints {
            $0.top.equalTo(livePopularMoviewView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        logoView.snp.makeConstraints {
            $0.top.equalTo(baseballLogoView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        gahyunPick.snp.makeConstraints {
            $0.top.equalTo(logoView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
    
    func setStyle() {
        
    }
    
}

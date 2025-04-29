//
//  MainViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/29/25.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    private let headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        setStyle()
        setEvent()
    }
    
    private func setUI() {
        view.addSubviews(headerView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview()
        }
        
    }
    
    private func setStyle() {
        
    }
    
    private func setEvent() {
        
    }
    
    
}

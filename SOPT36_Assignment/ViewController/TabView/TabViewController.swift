//
//  TabViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/29/25.
//

import UIKit

import SnapKit
import Then

final class TabViewController: BaseUIViewController {
    private let headerView = HeaderView()
    
    private let tabTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    private lazy var tabViewControllers: [UIViewController] = [
        HomeViewController(), DramaViewController(), EntertainmentViewController(),
        MovieViewController(), SportsViewController(), NewsViewController()
    ]
    private var selectedIndex: Int = 0
    private let tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView
            .register(TabViewCell.self, forCellWithReuseIdentifier: TabViewCell.cellIdentifier)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        switchToViewController(index: selectedIndex)
        
        setUI()
        setLayout()
        setStyle()
        setEvent()
    }

    override func setUI() {
        view.addSubviews(headerView, tabCollectionView)
    }
    
    override func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    override func setStyle() {
        
    }
    
    override func setEvent() {
        
    }
    
    private func switchToViewController(index: Int) {
        let selectedVC = tabViewControllers[index]
        children.forEach {
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
        addChild(selectedVC)
        view.addSubview(selectedVC.view)
        selectedVC.view.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        selectedVC.didMove(toParent: self)
    }
    
}

extension TabViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabTitles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabViewCell.cellIdentifier, for: indexPath) as? TabViewCell else {
            return UICollectionViewCell()
        }
        let isSelected = indexPath.item == selectedIndex
        cell.configure(title: tabTitles[indexPath.item], selected: isSelected)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        switchToViewController(index: selectedIndex)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = tabTitles[indexPath.item]
        let width = (title as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)]).width + 20
        return CGSize(width: width, height: 44)
    }
}

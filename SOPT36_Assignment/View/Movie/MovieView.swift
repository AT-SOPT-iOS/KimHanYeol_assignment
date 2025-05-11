//
//  MovieViewController.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class MovieView: UIView {
    
    private let tableView = UITableView().then {
        $0.backgroundColor = .black
        $0.separatorStyle = .none
        $0.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
    }
    private var boxOfficeList: [DailyBoxOffice] = []
    private var hasLoadedData = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        fetchData()
        
        // 데이터 계속 불러오는거 방지
        if superview != nil, !hasLoadedData {
            hasLoadedData = true
            fetchData()
        }
    }
    
    func setUI() {
        self.addSubview(tableView)
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func updateData(with list: [DailyBoxOffice]) {
        self.boxOfficeList = list
        tableView.reloadData()
    }
    
    func fetchData() {
        Task {
            do {
                let result = try await MovieService.shared.fetchMovieRankList()
                DispatchQueue.main.async {
                    self.updateData(with: result.dailyBoxOfficeList)
                }
            } catch {
                print("영화 랭킹 불러오기 실패: \(error)")
            }
        }
    }
}

// MARK: - UITableViewDataSource & Delegate
extension MovieView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        let movie = boxOfficeList[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

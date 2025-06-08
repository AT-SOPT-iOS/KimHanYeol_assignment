//
//  TvingTabView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 6/3/25.
//

import SwiftUI

struct TvingTabView: View {
    
    //MARK: - Properties

    var selectedTab: StickyHeaderType
    
    //MARK: - Main Body

    var body: some View {
        switch selectedTab {
        case .home:
            HomeView()
        case .drame:
            Text("드라마").foregroundStyle(.white)
        case .entertainment:
            Text("예능").foregroundStyle(.white)
        case .movie:
            Text("영화").foregroundStyle(.white)
        case .news:
            Text("뉴스").foregroundStyle(.white)
        case .sports:
            Text("스포츠").foregroundStyle(.white)
        }
    }
}

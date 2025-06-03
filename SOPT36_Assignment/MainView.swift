//
//  MainView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/27/25.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Property Wrappers

    @State var selectedTab: StickyHeaderType = .home
    
    //MARK: - Main Body

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                TvingHeader()
                Section(header: StickyHeader(selectedTab: $selectedTab)) {
                    TvingTabView(
                        selectedTab: selectedTab,
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .clipped()
        .background(.black)
    }
}

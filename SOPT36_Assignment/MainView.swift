//
//  MainView.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/27/25.
//

import SwiftUI

enum StickyHeaderType: String, CaseIterable {
    case home = "홈"
    case drame = "드라마"
    case entertainment = "예능"
    case movie = "영화"
    case sports = "스포츠"
    case news = "뉴스"
}

struct MainView: View {
    @State var selectedTab: StickyHeaderType = .home
    
    let rows = [GridItem(.flexible())]
    let titleImages = PosterModel.dummy()
    let liveImages = ProgramModel.dummy()
    let baseballImages = BaseballModel.dummy()
    let logoImages = LogoModel.dummy()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews:[.sectionHeaders]) {
                tvingHeaderSection
                
                Section(header: stickyHeaderSction){
//                    titleImageSection
//                    todayTvingSection
//                    livePopularSection
//                    movieSection
                    baseballSection

                    
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 7) {
                        ForEach(Array(logoImages.indices), id: \.self) { index in
                            Image(uiImage: logoImages[index].posterImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 68, height: 34)
                                .padding(.horizontal, 11)
                                .padding(.vertical, 5)
                                .background(.gray4)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.bottom, 25)
                
            }
        }
        .scrollIndicators(.hidden)
        .clipped()
        .background(.black)
        
    }
}

extension MainView {
    private var tvingHeaderSection: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(.tvingLogo)
                .resizable()
                .frame(width: 191, height: 78)
            
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
                .foregroundStyle(.white)
            
            Image(.tvingIcon)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .padding(.trailing, 11)
        }
    }
    
    private var stickyHeaderSction: some View {
        HStack(spacing: 10) {
            ForEach(StickyHeaderType.allCases, id: \.self) { tab in
                VStack(spacing: 0) {
                    Text(tab.rawValue)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                        .frame(height: 27)
                        .onTapGesture {
                            selectedTab = tab
                        }
                    
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(tab == selectedTab ? .white : .clear)
                        .padding(.top, 7)
                        .padding(.horizontal, 5)
                }
            }
        }
        .padding(.bottom, 7)
        .background(.black)
    }
    
    private var titleImageSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(titleImages.indices, id: \.self) { index in
                    Image(uiImage: titleImages[index].posterImage)
                        .resizable()
                        .frame(width: 375, height: 400)
                }
            }
            .padding(.bottom, 9)
        }
    }
    
    private var todayTvingSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("오늘의 티빙 TOP 20")
                .font(.system(size: 15, weight: .bold))
                .padding(.bottom, 9)
                .padding(.leading, 12)
                .foregroundStyle(.white)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(Array(titleImages.indices), id: \.self) { index in
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(index + 1)")
                                .font(.system(size: 50, weight: .bold))
                                .italic()
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                            
                            Image(uiImage: titleImages[index].posterImage)
                                .resizable()
                                .frame(width: 98, height: 146)
                        }
                        .padding(.trailing, 5)
                    }
                }
                .padding(.horizontal, 5)
            }
        }
        .padding(.bottom, 20)
    }
    
    private var livePopularSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("실시간 인기 LIVE")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("더보기")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 9)
            .padding(.horizontal, 12)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(Array(liveImages.indices), id: \.self) { index in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(uiImage: liveImages[index].posterImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 80)
                                .padding(.bottom, 15)
                            
                            HStack(alignment: .top, spacing: 2) {
                                Text("\(index + 1)")
                                    .font(.system(size: 19, weight: .bold))
                                    .italic()
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(liveImages[index].title)
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                    Text(liveImages[index].description)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(.gray2)
                                    Text(liveImages[index].rating)
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundColor(.gray2)
                                }
                            }
                            .padding(.horizontal, 6)
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
        }
        .padding(.bottom, 18)
    }

    private var movieSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Text("실시간 인기 영화")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("더보기")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            .padding(.bottom, 9)
            .padding(.horizontal, 12)

            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 8) {
                    ForEach(Array(titleImages.indices), id: \.self) { index in
                        Image(uiImage: titleImages[index].posterImage)
                            .resizable()
                            .frame(width: 98, height: 146)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.bottom, 28)
    }

    private var baseballSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 0) {
                ForEach(Array(baseballImages.indices), id: \.self) { index in
                    Image(uiImage: baseballImages[index].posterImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(index%2==0 ? .white : .black)
                }
            }
        }
        .padding(.bottom, 28)
    }
}

#Preview {
    MainView()
}

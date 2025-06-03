//
//  ContentView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/3/25.
//

import SwiftUI

enum TabCategory: String, CaseIterable, Identifiable {
    var id: Self { self }
    case home = "홈"
    case drama = "드라마"
    case movie = "영화"
    case fun = "예능"
    case sports = "스포츠"
    case news = "뉴스"
}


struct PagingTabView: View {
    @State private var selectedTab: TabCategory = .home

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 28) {
                    ForEach(TabCategory.allCases) { tab in
                        Button(action: {
                            withAnimation {
                                selectedTab = tab
                            }
                        }) {
                            Text(tab.rawValue)
                                .foregroundColor(.white)
                                .fontWeight(selectedTab == tab ? .bold : .regular)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background(Color.black)
            }

            Divider().background(Color.gray)

            TabContentView(tab: selectedTab)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.edgesIgnoringSafeArea(.bottom))
        }
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }
}


@ViewBuilder
func TabContentView(tab: TabCategory) -> some View {
    switch tab {
    case .home:
        Text("홈 콘텐츠")
            .foregroundStyle(.white)
    case .drama:
        Text("드라마 콘텐츠")
            .foregroundStyle(.white)
    case .movie:
        Text("영화 콘텐츠")
            .foregroundStyle(.white)
    case .fun:
        Text("예능 콘텐츠")
            .foregroundStyle(.white)
    case .sports:
        Text("스포츠 콘텐츠")
            .foregroundStyle(.white)
    case .news:
        Text("뉴스 콘텐츠")
            .foregroundStyle(.white)
    }
}

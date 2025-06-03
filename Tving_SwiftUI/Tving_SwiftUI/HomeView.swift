//
//  HomeView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                Image("whatsyourname")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                
                HStack {
                    Text("오늘의 티빙 TOP 20")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 12)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {

                        
                        ForEach(Array(movies.enumerated()), id: \.element.id) { index, movie in
                            RankingItemView(movie: movie, rank: index + 1)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .frame(height: 240)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.3))
                        .frame(height: 200)
                        .overlay(Text("콘텐츠 \(index)").foregroundColor(.white))
                        .padding(.horizontal, 16)
                }

                Spacer(minLength: 40)
            }
        }
        .background(Color.black)
    }
    
    let movies = [
        Movie(id: 1, title: "어벤져스: 엔드게임", posterName: "harryPotter"),
        Movie(id: 2, title: "스파이더맨: 노 웨이 홈", posterName: "harryPotter"),
        Movie(id: 3, title: "탑건: 매버릭", posterName: "harryPotter"),
        Movie(id: 4, title: "아바타: 물의 길", posterName: "harryPotter"),
        Movie(id: 5, title: "블랙 팬서", posterName: "harryPotter"),
        Movie(id: 6, title: "타이타닉", posterName: "harryPotter"),
        Movie(id: 7, title: "쥬라기 월드", posterName: "harryPotter"),
        Movie(id: 8, title: "라이온 킹", posterName: "harryPotter"),
        Movie(id: 9, title: "인크레더블 2", posterName: "harryPotter"),
        Movie(id: 10, title: "미니언즈", posterName: "harryPotter"),
        Movie(id: 11, title: "겨울왕국 2", posterName: "harryPotter"),
        Movie(id: 12, title: "스타워즈", posterName: "harryPotter"),
        Movie(id: 13, title: "해리포터", posterName: "harryPotter"),
        Movie(id: 14, title: "반지의 제왕", posterName: "harryPotter"),
        Movie(id: 15, title: "다크나이트", posterName: "harryPotter"),
        Movie(id: 16, title: "인터스텔라", posterName: "harryPotter"),
        Movie(id: 17, title: "기생충", posterName: "harryPotter"),
        Movie(id: 18, title: "올드보이", posterName: "harryPotter"),
        Movie(id: 19, title: "캐스트 어웨이", posterName: "harryPotter"),
        Movie(id: 20, title: "포레스트 검프", posterName: "harryPotter")
    ]
}

//
//  RankingItemView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct RankingItemView: View {
    let movie: Movie
    let rank: Int
    
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                Spacer()
                Text("\(rank)")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.8), radius: 2, x: 1, y: 1)
            }
            .frame(width: 50)

            VStack {
                Image(movie.posterName)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fill) 
                    .frame(width: 120, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
            }
        }
        .frame(width: 180, height: 220)
    }
}

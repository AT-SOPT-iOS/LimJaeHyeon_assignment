//
//  RealTimePopularLiveView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct RealTimePopularLiveView: View {
    let rank: String
    let posterImageName: String
    let title: String
    let episode: String
    let rating: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(posterImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height * 0.2)
            
            HStack(spacing: 3) {
                Text(rank)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(6))
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 1) {
                    Text(title)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text(episode)
                        .font(.system(size: 12, weight: .thin))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text(rating)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .background(Color.black)
    }
}


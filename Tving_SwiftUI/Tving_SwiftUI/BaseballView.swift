//
//  BaseballView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct BaseBallView: View {
    let posterName: String

    var body: some View {
        VStack(spacing: 0) {
            Image(posterName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 50)
                .clipped()
        }
        .background(.white)
    }
}


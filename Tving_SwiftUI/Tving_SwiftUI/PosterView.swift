//
//  PosterView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct PosterView: View {
    let posterImageName: String

    var body: some View {
        VStack(spacing: 4) {
            Image(posterImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 98, height: 146)
                .clipped()
        }
    }
}

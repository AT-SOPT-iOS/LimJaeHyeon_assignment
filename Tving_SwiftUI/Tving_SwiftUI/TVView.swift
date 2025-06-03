//
//  TVView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/4/25.
//

import SwiftUI

struct TVView: View {
    let posterName: String

    var body: some View {
        VStack(spacing: 0) {
            Image(posterName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 45)
                .clipped()
        }
    }
}

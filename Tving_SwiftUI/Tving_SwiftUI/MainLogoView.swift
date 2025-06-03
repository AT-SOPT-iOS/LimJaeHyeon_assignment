//
//  MainLogoView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/3/25.
//

import SwiftUI

struct MainLogoView: View {
    var body: some View {
        HStack {
            Image("TVING")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 191, height: 78)
            Spacer()
            Image("Search")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
        }
        .background(.black)
    }
}



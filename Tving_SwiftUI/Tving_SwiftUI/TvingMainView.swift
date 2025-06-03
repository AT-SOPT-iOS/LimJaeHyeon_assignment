//
//  TvingMainView.swift
//  Tving_SwiftUI
//
//  Created by 임재현 on 6/3/25.
//

import SwiftUI

struct TvingMainView: View {
    var body: some View {
        VStack(spacing: 0) {
            MainLogoView()
            PagingTabView()

            Spacer()
        }
        .background(.black)
    }
}


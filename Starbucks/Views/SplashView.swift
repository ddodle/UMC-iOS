//
//  SplashView.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("StarbucksLogo")
              .resizable()
              .frame(width: 120, height: 120)
              .aspectRatio(contentMode: .fit)
        }
        .frame(width: 440, height: 956)
        .background(.green01)
    }
}

#Preview {
    SplashView()
}

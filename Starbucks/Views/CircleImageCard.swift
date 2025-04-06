//
//  CircleImageCard.swift
//  Starbucks
//
//  Created by 김도연 on 4/6/25.
//

import SwiftUI

struct CircleImageCard: View {
    var menuItem: MenuItem
    
    var body: some View {
        VStack {
            Image(menuItem.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text(menuItem.name)
                .font(.caption)
                .fontWeight(.bold)
        }
        .frame(width: 120, height: 160)
    }
}

#Preview {
    CircleImageCard(menuItem: MenuItem(name: "에스프레소 콘파나", imageName: "espresso_conpana"))
}

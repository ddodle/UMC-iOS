//
//  ItemButtonView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct ItemButtonView: View {
    let title: String
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(title)
                    .font(.callout)
                    .foregroundStyle(.black)
                Spacer()
            }
        }
        
    }
}

#Preview {
    ItemButtonView(title: "스타벅스 카드 등록", imageName: "card",action: {print("card")})
}

//
//  WhatsNewCard.swift
//  Starbucks
//
//  Created by 김도연 on 4/7/25.
//

import SwiftUI

struct WhatsNewCard: View {
    var whatsNew: WhatsNew
    
    var body: some View {
        VStack(alignment: .leading){
            Image(whatsNew.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 240, height: 160)
            
            Text(whatsNew.title)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(whatsNew.detail)
                .font(.caption)
        }
        .frame(width: 240, height: 240)
    }
}

#Preview {
    WhatsNewCard(whatsNew: WhatsNew(title: "5년 3월 일회용컵 없는 날 캠페인", detail: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요.", imageName: "noCup"))
}

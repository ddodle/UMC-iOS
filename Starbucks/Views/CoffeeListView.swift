//
//  CoffeeListView.swift
//  Starbucks
//
//  Created by 김도연 on 5/6/25.
//

import SwiftUI

struct CoffeeListView: View {
    var coffeeDetail: CoffeeDetail
    
    var body: some View {
        HStack {
            Image(coffeeDetail.menuImage)
                .resizable()
                .frame(maxWidth: 60, maxHeight: 60)
                .clipShape(Circle())
            
            Spacer()
            
            VStack{
                Text(coffeeDetail.menuKorName)
                    .font(.title3)
                    .foregroundStyle(.black02)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(coffeeDetail.menuEngName)
                    .font(.footnote)
                    .foregroundStyle(.gray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
}

#Preview {
    CoffeeListView(coffeeDetail: CoffeeDetail(menuImage: "cafe_americano", menuKorName: "카페 아메리카노", menuEngName: "Cafe_Americano", menuDescription: "", price: "4500", option: .hot))
}

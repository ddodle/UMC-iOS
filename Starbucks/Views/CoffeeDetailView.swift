//
//  CoffeDetailView.swift
//  Starbucks
//
//  Created by 김도연 on 4/7/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    var coffeeDetail: CoffeeDetail
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        VStack(spacing: 20){
            ZStack{
                Image(coffeeDetail.menuImage)
                    .frame(alignment: .top)
            }
            .ignoresSafeArea()
            
            VStack(alignment: .leading){
                HStack{
                    Text(coffeeDetail.menuKorName)
                        .font(.title2)
                        .bold()
                    Image("new")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Text(coffeeDetail.menuEngName)
                    .font(.caption)
                    .foregroundStyle(.gray02)
                    .padding(.horizontal)
                
                Spacer()
                    .frame(height: 28)
                
                Text(coffeeDetail.menuDescription)
                    .font(.footnote)
                    .foregroundStyle(.gray06)
                    .padding(.horizontal)
                
                Spacer()
                    .frame(height: 20)
                
                Text(coffeeDetail.price)
                    .font(.title2)
                    .padding(.horizontal)
                
                Spacer()
                    .frame(height: 28)
                
                Text("토글")
                    .padding(.horizontal)
            }
            
            Spacer()
            
            orderButton
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {backbutton}
            
            ToolbarItem(placement: .navigationBarTrailing) {sharebutton}
        }
        .padding(.bottom)
    }
    
    var orderButton: some View{
        VStack{
            Button(action: {print("주문하기")}, label: {
              Text("주문하기")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(height: 48)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.green00)
        }
        .padding(.horizontal)
    }
    
    var backbutton: some View{
        VStack{
            Button{
                self.dismiss()
            }label:{
                Image("back")
            }
        }
    }
    
    var sharebutton: some View{
        VStack{
            Button{
                print("shared")
            }label:{
                Image("shar")
            }
        }
    }
}

#Preview {
    CoffeeDetailView(coffeeDetail: CoffeeDetail(menuImage: "Espresso_Conpana_detail", menuKorName: "에스프레소 콘 파나", menuEngName: "Espresso Con Panna", menuDescription: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료", price: "4,100원", option: .hotOnly))
}

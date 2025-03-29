//
//  OtherView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct OtherView: View {
    @StateObject private var otherViewModel = OtherViewModel()
    
    var body: some View {
        ZStack{
            Color(.white00)
                .ignoresSafeArea()
            
            VStack{
                Topbar
                
                ScrollView{
                    VStack(spacing: 24){
                        Info
                        Pay
                        Divider()
                        Service
                    }
                    .padding()
                }
            }
        }
    }
    
    var Topbar: some View{
        HStack{
            Text("Other")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Button(action: {print("logout")}){
                Image("logout")
            }
        }
        .padding()
        .background(.white)
    }
    
    var Info: some View{
        VStack{
            (
                Text("\(otherViewModel.nickname)")
                    .foregroundColor(.green01)
                + Text("님 \n환영합니다!🙌🏻")
                    .foregroundColor(.black01)
            )
            .font(.title)
            .multilineTextAlignment(.center)
            
            HStack{
                IconButton(title: "별 히스토리", imageName: "star_history", action: {print("star_history")})
                IconButton(title: "전자영수증", imageName: "receipt", action: {print("receipt")})
                IconButton(title: "나만의 메뉴", imageName: "myReceipt", action: {print("myReceipt")})
            }
        }
    }
    
    var Pay: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("Pay")
                .font(.title3)
                .fontWeight(.bold)
            LazyVGrid(columns:
                [GridItem(.flexible())
               ,GridItem(.flexible())
                ], spacing: 16) {
                ItemButtonView(title: "스타벅스 카드 등록", imageName: "card", action: {print("card")})
                ItemButtonView(title: "카드 교환권 등록", imageName: "card_change", action: {print("card_change")})
                ItemButtonView(title: "쿠폰 등록", imageName: "coupon", action: {print("coupon")})
                ItemButtonView(title: "쿠폰 히스토리", imageName: "coupon_history", action: {print("coupon_history")})
            }
        }
    }
    
    
    var Service: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("고객 지원")
                .font(.title3)
                .fontWeight(.bold)
            LazyVGrid(columns:
                [GridItem(.flexible())
                 ,GridItem(.flexible())
                ], spacing: 16) {
                ItemButtonView(title: "스토어 케어", imageName: "store_care", action: {print("store_care")})
                ItemButtonView(title: "고객의 소리", imageName: "customer", action: {print("customer")})
                ItemButtonView(title: "매장 정보", imageName: "store_info", action: {print("store_info")})
                ItemButtonView(title: "반납기 정보", imageName: "return_info", action: {print("return_info")})
                ItemButtonView(title: "마이 스타벅스 리뷰", imageName: "my_review", action: {print("my_review")})
            }
        }
    }
}

#Preview {
    OtherView()
}

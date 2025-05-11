//
//  HomeView.swift
//  Starbucks
//
//  Created by 김도연 on 4/6/25.
//

import SwiftUI

struct HomeView : View {
    @State private var progress: Float = 1 / 12.0
    @StateObject var menuViewModel = MenuViewModel()
    @StateObject var whatsNewViewModel = WhatsNewViewModel()
    @StateObject var otherViewModel = OtherViewModel()
    @StateObject var breadViewModel = BreadViewModel()
    @StateObject var coffeeDetailViewModel = CoffeeDetailViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    topBanner
                        .padding(.horizontal)
                    mainBanner
                    
                }
                
            }
            .ignoresSafeArea(.all)
        }
    }
    
    var mainBanner: some View{
        VStack{
            Image("bear_ad")
                .resizable()
                .padding(.horizontal, 20)
            
            VStack (alignment: .leading){
                Group{
                    Text(otherViewModel.nickname)
                        .font(.title2)
                        .foregroundStyle(.brown01)
                        .bold()
                    +
                    Text("님을 위한 추천 메뉴")
                        .font(.title2)
                        .bold()
                }
                .padding()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(menuViewModel.menuItems) { menuItem in
                            NavigationLink(destination: CoffeeDetailView(coffeeDetail: coffeeDetailViewModel.coffeeDetail.first { $0.menuKorName == menuItem.name } ?? coffeeDetailViewModel.coffeeDetail[0])) {
                                CircleImageCard(menuItem: menuItem)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            VStack{
                Image("eventBanner")
                Image("serviceSubscribe")
            }
            
            VStack (alignment: .leading){
                Text("What's new")
                    .font(.title2)
                    .padding()
                    .bold()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(whatsNewViewModel.WhatsNews){ WhatsNew in
                            WhatsNewCard(whatsNew: WhatsNew)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            VStack{
                Image("1mug")
                Image("2onlinestore")
                Image("3delivery")
            }
            
            VStack (alignment: .leading){
                Text("하루가 달콤해지는 디저트")
                    .font(.title2)
                    .padding()
                    .bold()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(breadViewModel.menuItems) { menuItem in
                            CircleImageCard(menuItem: menuItem)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            VStack{
                Image("4coldbrew")
                Image("5drink")
                Image("6sizeup")
            }
            
        }
        .padding()
    }
    
    var topBanner: some View{
        ZStack{
            VStack {
                Image("top_img")
                
                Spacer()
            }
            
            VStack(alignment: .leading){
                
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.title2)
                    .bold()
                    .padding()
                    .padding(.top, 100)
                
                HStack {
                    VStack(alignment: .leading){
                        Text("11 ★ until next Reward")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.brown01)
                        
                        ProgressView(value: progress, total: 1)
                            .tint(.brown01)
                            .frame(height: 10)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Text("1")
                            .font(.largeTitle)
                            .bold()
                        Text("/")
                            .font(.title)
                        Text("12★")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.brown01)
                    }
                }
                .padding()

            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}

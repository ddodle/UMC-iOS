//
//  TabView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    VStack{
                        Image(selectedTab == 0 ? "homeSelected":"home")
                        Text("Home")
                    }
                }
                .tag(0)
            
            Color.white
                .tabItem {
                    VStack{
                        Image(selectedTab == 1 ? "paySelected":"pay")
                        Text("Pay")
                    }
                }
                .tag(1)
            
            OrderView()
                .tabItem {
                    VStack{
                        Image(selectedTab == 2 ? "orderSelected":"order")
                        Text("Order")
                    }
                }
                .tag(2)
            
            ShopView()
                .tabItem {
                    VStack{
                        Image(selectedTab == 3 ? "shopSelected":"shop")
                        Text("Shop")
                    }
                }
                .tag(3)
            
            OtherView()
                .tabItem {
                    VStack{
                        Image(selectedTab == 4 ? "otherSelected":"other")
                        Text("Other")
                    }
                }
                .tag(4)
        }
        .tint(.green02)
        .navigationBarBackButtonHidden(true)
        .environmentObject(loginViewModel)
    }
}


#Preview {
    MainTabView()
}

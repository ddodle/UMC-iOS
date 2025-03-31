//
//  TabView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Color.white
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

            Color.white
                .tabItem {
                    VStack{
                        Image(selectedTab == 2 ? "orderSelected":"order")
                        Text("Order")
                    }
                }
                .tag(2)

            Color.white
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
    }
}


#Preview {
    MainTabView()
}

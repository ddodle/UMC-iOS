//
//  ShopView.swift
//  Starbucks
//
//  Created by 김도연 on 4/28/25.
//

import SwiftUI
import UIKit

struct ShopView: View {
    @StateObject var productsViewModel = ProductsViewModel()
    @Environment(\.dismiss) var dismiss
    @State static var currentPage : Int = 0
    
    var body: some View {
        ZStack{
            Color.white00
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment : .leading){
                    Text("Starbucks Online Store")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    whatsNewView
                    
                    productsView
                    
                    bestItemView
                    
                    newProductsView
                    
                }
                .padding(.horizontal)
            }
        }
    }
    
    var whatsNewView : some View{
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(["banner1","banner2","banner3"], id: \.self){ item in
                    Image(item)
                }
            }
        }
    }
    
    var productsView : some View{
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(productsViewModel.menuItems) { menuItem in
                    NavigationLink(destination: Color.red){
                        CircleImageCard(menuItem: menuItem)
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
    
    var bestItemView : some View{
        VStack {
            Text("bestItem")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns:
                [GridItem(.flexible())
               ,GridItem(.flexible())
                ]) {
                VStack{
                    Image("page1-1")
                    Text("그린 사이렌 슬리브 머그\n355ml")
                }
                VStack{
                    Image("page1-2")
                    Text("그린 사이렌 클래식 머그\n355ml")
                }
                VStack{
                    Image("page1-3")
                    Text("사이렌 머그 앤 우드 소서")
                }
                VStack{
                    Image("page1-4")
                    Text("리저브 골드 테일 머그\n355ml")
                }
            }
        }
        .padding(.bottom, 30)
    }
    
    var newProductsView : some View{
        VStack{
            Text("New Products")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            LazyVGrid(columns:
                [GridItem(.flexible())
               ,GridItem(.flexible())
                ]) {
                VStack{
                    Image("greenmug")
                    Text("그린 사이렌 도트 머그\n237ml")
                }
                VStack{
                    Image("greenmug")
                    Text("그린 사이렌 도트 머그\n355ml")
                }
                VStack{
                    Image("minimugset")
                    Text("홈 카페 미니 머그 세트")
                }
                VStack{
                    Image("homecafeglassset")
                    Text("홈 카페 글라스 세트")
                }
            }
        }
    }
}

#Preview {
    ShopView()
}

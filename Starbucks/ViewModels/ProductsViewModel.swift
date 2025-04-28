//
//  ProductsViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 4/28/25.
//

import SwiftUI

class ProductsViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "텀블러", imageName: "tumbler"),
        MenuItem(name: "커피 용품", imageName: "coffeeproduct"),
        MenuItem(name: "선물세트", imageName: "giftset"),
        MenuItem(name: "보온병", imageName: "hotbottle"),
        MenuItem(name: "머그/컵", imageName: "mug"),
        MenuItem(name: "라이프스타일", imageName: "lifestyle")
    ]
}

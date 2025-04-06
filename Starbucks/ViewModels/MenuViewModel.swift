//
//  HomeViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 4/6/25.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var userName: String
    
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "에스프레소 콘파나", imageName: "espresso_conpana"),
        MenuItem(name: "에스프레소 마키아또", imageName: "espresso_macchiato"),
        MenuItem(name: "아이스 카페 아메리카노", imageName: "iced_cafe_americano"),
        MenuItem(name: "카페 아메리카노", imageName: "cafe_americano"),
        MenuItem(name: "아이스 카라멜 마키아또", imageName: "iced_caramel_macchiato"),
        MenuItem(name: "카라멜 마키아또", imageName: "caramel_macchiato")
    ]
    
    init() {
        self.userName = UserDefaults.standard.string(forKey: "nickname") ?? "(설정 닉네임)"
    }
    
    var displayName: String {
        return userName
    }
}

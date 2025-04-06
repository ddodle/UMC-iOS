//
//  read.swift
//  Starbucks
//
//  Created by 김도연 on 4/7/25.
//

import SwiftUI

class BreadViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "너티 크루아상", imageName: "croissant"),
        MenuItem(name: "매콤 소세지 불고기", imageName: "sausage"),
        MenuItem(name: "미니 리프 파이", imageName: "minipie"),
        MenuItem(name: "뺑 오 쇼콜라", imageName: "ochocolate"),
        MenuItem(name: "소세지 & 올리브 파이", imageName: "sausagepie")
    ]
}

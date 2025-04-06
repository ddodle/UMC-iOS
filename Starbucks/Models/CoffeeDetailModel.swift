//
//  CoffeModel.swift
//  Starbucks
//
//  Created by 김도연 on 4/7/25.
//

import Foundation
import SwiftUI

struct CoffeeDetail: Identifiable {
    var id = UUID()
    var menuImage: String
    var menuKorName: String
    var menuEngName: String
    var menuDescription: String
    var price: String
    var option: CoffeeOption
}

enum CoffeeOption: String {
    case hot = "HOT"
    case iced = "ICED"
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICED ONLY"
    
    var availableOptions: [Self] {
        switch self {
        case .hotOnly:
            return [.hotOnly]
        case .icedOnly:
            return [.icedOnly]
        default:
            return [.hot, .iced]
        }
    }
    
    var textColor: Color {
        switch self {
        case .hot, .hotOnly:
            return Color("red01")
        case .iced, .icedOnly:
            return Color("blue01")
        }
    }
}

//
//  FontManager.swift
//  Starbucks
//
//  Created by 김도연 on 3/21/25.
//

import SwiftUI

extension Font {
    public enum Pretendard {
        case semibold
        case medium
        case regular
        case bold
        case extraBold
        case light
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .bold:
                return "Pretendard-Bold"
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .light:
                return "Pretendard-Light"
            case .custom(let name):
                return name
            }
        }
    }

    static func pretendard(_ type: Pretendard, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
}

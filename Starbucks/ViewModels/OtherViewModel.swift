//
//  OtherViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import Foundation
import SwiftUI

class OtherViewModel: ObservableObject{
    @AppStorage("nickname") var nickname: String = "(작성한 닉네임)"
}

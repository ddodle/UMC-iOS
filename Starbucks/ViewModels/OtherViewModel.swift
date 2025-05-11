//
//  OtherViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import Foundation
import SwiftUI

class OtherViewModel: ObservableObject{
    @Published var nickname: String = ""
    
    private let service = "com.starbucksapp.auth"
    private let accountNickname = "userNickname"
    
    init(){
        loadNicknameFromkeychain()
    }
    
    private func loadNicknameFromkeychain(){
        nickname = KeychainService.shared.read(service: service, account: accountNickname) ?? "등록된 닉네임"
    }
}

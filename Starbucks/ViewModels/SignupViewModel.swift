//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signup: Signup = Signup()
    
    private let service = "com.starbucksapp.auth"
    private let accountEmail = "userEmail"
    private let accountPassword = "userPassword"
    private let accountNickname = "userNickname"
    
    func signupAndSave(){
        guard !signup.nickname.isEmpty,
              !signup.password.isEmpty,
              !signup.email.isEmpty
        else {
            return
        }
        
        KeychainService.shared.save(signup.nickname, service: service, account: accountNickname)
        KeychainService.shared.save(signup.password, service: service, account: accountPassword)
        KeychainService.shared.save(signup.email, service: service, account: accountEmail)
    }
}

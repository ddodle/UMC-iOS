//
//  LoginViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var user: User = User()
    @AppStorage("isLogin") var isAuthenticated: Bool = false
    @AppStorage("autoLoginEnabled") private var autoLoginEnabled: Bool = true
    @Published var errorMessage: String? = nil
    
    private let service = "com.starbucksapp.auth"
    private let accountEmail = "userEmail"
    private let accountPassword = "userPassword"

    init() {
        if autoLoginEnabled {
            checkAutoLogin()
        }
    }

    func checkAutoLogin() {
        if let storedEmail = KeychainService.shared.read(service: service, account: accountEmail),
           let storedPwd   = KeychainService.shared.read(service: service, account: accountPassword) {
            user.id = storedEmail
            user.password = storedPwd
            isAuthenticated = true
        }
    }

    func login() {
        guard let storedEmail = KeychainService.shared.read(service: service, account: accountEmail),
              let storedPwd   = KeychainService.shared.read(service: service, account: accountPassword)
        else {
            errorMessage = "등록된 회원 정보가 없습니다."
            return
        }

        if user.id == storedEmail && user.password == storedPwd {
            autoLoginEnabled = true
            isAuthenticated = true
            errorMessage = nil
        } else {
            isAuthenticated = false
            errorMessage = "이메일 또는 비밀번호가 틀립니다."
        }
    }

    func logout() {
        isAuthenticated = false
        autoLoginEnabled = false
    }
}

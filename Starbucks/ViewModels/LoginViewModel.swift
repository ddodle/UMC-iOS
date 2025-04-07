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
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String? = nil
    
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""
    
    func login() {
        if user.id == storedEmail && user.password == storedPassword {
            isAuthenticated = true
            errorMessage = nil
        } else {
            isAuthenticated = false
            errorMessage = "이메일 또는 비밀번호가 틀립니다."
        }
    }
    
    func logout() {
            isAuthenticated = false
            user.id = ""
            user.password = ""
        }
}


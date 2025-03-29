//
//  SignupViewModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var signup: Signup = Signup()
    
    func saveToAppStorage(nickname: String, email: String, password: String){
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
    }
}

//
//  SignupModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import Foundation

class Signup: ObservableObject{
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
}

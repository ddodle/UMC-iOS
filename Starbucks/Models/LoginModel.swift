//
//  LoginModel.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import Foundation

class User: ObservableObject{
    @Published var id: String = ""
    @Published var password: String = ""
}


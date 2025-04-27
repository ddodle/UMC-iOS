//
//  StarbucksApp.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import SwiftUI

@main
struct StarbucksApp: App {
    @AppStorage("isLogin") private var isAuthenticated: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                MainTabView()
            }else{
                LoginView()
            }
            ContentView()
        }
    }
}

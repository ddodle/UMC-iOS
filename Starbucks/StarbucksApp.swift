//
//  StarbucksApp.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct StarbucksApp: App {
    @AppStorage("isLogin") private var isAuthenticated: Bool = false
    
    init(){
        let kakaoNativeAppKey = (Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as? String) ?? ""
        KakaoSDK.initSDK(appKey: kakaoNativeAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                MainTabView()
            }else{
                LoginView()
                    .onOpenURL(perform: { url in
                        if AuthApi.isKakaoTalkLoginUrl(url) {
                            _ = AuthController.handleOpenUrl(url: url)
                        }
                    })
            }
        }
    }
}

//
//  AppDelegate.swift
//  Starbucks
//
//  Created by 김도연 on 5/11/25.
//
import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    KakaoSDK.initSDK(appKey: "${KAKAO_NATIVE_APP_KEY}")
    return true
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }
}

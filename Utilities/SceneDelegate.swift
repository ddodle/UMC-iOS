//
//  SceneDelegate.swift
//  Starbucks
//
//  Created by 김도연 on 5/11/25.
//

import SwiftUI
import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
}

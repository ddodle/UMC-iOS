//
//  Kakao.swift
//  Starbucks
//
//  Created by 김도연 on 5/11/25.
//
import Foundation
import KakaoSDKUser
import KakaoSDKAuth

func kakaoLogin() {
    let service        = "com.Starbucksapp.auth"
    let accessAccount  = "kakaoAccessToken"
    let refreshAccount = "kakaoRefreshToken"
    
    func handleLoginResult(_ token: OAuthToken?, _ error: Error?) {
        if let error = error {
            print("❌ 카카오 로그인 실패:", error)
            return
        }
        guard let token = token else {
            print("❌ 토큰이 없습니다.")
            return
        }
        // accessToken은 항상 String이니 바로 저장
        KeychainService.shared.save(token.accessToken,
                                    service: service,
                                    account: accessAccount)
        // refreshToken도 String이니 바로 저장
        KeychainService.shared.save(token.refreshToken,
                                    service: service,
                                    account: refreshAccount)
        
        UserDefaults.standard.set(true, forKey: "isLogin")
        print("✅ 카카오 로그인 성공, 토큰 저장 완료")
    }
    
    if UserApi.isKakaoTalkLoginAvailable() {
        UserApi.shared.loginWithKakaoTalk(completion: handleLoginResult)
    } else {
        UserApi.shared.loginWithKakaoAccount(completion: handleLoginResult)
    }
}

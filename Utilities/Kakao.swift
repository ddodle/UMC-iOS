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
    let service           = "com.starbucksapp.auth"
    let accessAccount     = "kakaoAccessToken"
    let refreshAccount    = "kakaoRefreshToken"
    let nicknameAccount   = "userNickname"
    
    func handleLoginResult(_ token: OAuthToken?, _ error: Error?) {
        if let error = error {
            print("❌ 카카오 로그인 실패:", error)
            return
        }
        guard let token = token else {
            print("❌ 토큰이 없습니다.")
            return
        }
        // 1) 토큰 저장
        KeychainService.shared.save(token.accessToken,
                                    service: service,
                                    account: accessAccount)
        KeychainService.shared.save(token.refreshToken,
                                    service: service,
                                    account: refreshAccount)
        
        // 2) 프로필 조회해서 닉네임 저장 → 완료된 뒤에야 로그인 플래그 세팅
        UserApi.shared.me() { user, error in
            if let profile = user?.kakaoAccount?.profile,
               let nick = profile.nickname {
                KeychainService.shared.save(nick,
                                            service: service,
                                            account: nicknameAccount)
                print("✅ 닉네임 키체인 저장 완료:", nick)
            } else {
                print("❌ 유저 정보 조회 실패 또는 닉네임 없음:", error ?? "")
            }
            // 3) isLogin = true
            UserDefaults.standard.set(true, forKey: "isLogin")
            print("✅ 카카오 로그인 완료")
        }
    }
    
    if UserApi.isKakaoTalkLoginAvailable() {
        UserApi.shared.loginWithKakaoTalk(completion: handleLoginResult)
    } else {
        UserApi.shared.loginWithKakaoAccount(completion: handleLoginResult)
    }
}

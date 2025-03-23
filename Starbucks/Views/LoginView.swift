//
//  LoginView.swift
//  Starbucks
//
//  Created by 김도연 on 3/17/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var LoginViewModle = LoginViewModel()

  var body: some View {
    VStack(alignment: .leading) {
      Spacer()
        .frame(maxHeight: 104)

      titleHeader

      Spacer()
        .frame(minHeight: 16)

      loginField

      Spacer()
        .frame(minHeight: 16)

      thirdPartyLoginField
    }
    .frame(maxWidth: .infinity)
    .padding()
  }

  var titleHeader: some View {
    VStack(alignment: .leading, spacing: 0) {
      Image("StarbucksLogo")
        .resizable()
        .scaledToFit()
        .frame(width: 95)
        .fixedSize()

      Spacer()
        .frame(maxHeight: 40)

      Text("안녕하세요.\n스타벅스입니다.")
        .font(.pretendard(.bold, size: 28))
        .fixedSize()

      Spacer()
        .frame(maxHeight: 20)

      Text("회원 서비스 이용을 위해 로그인 해주세요.")
        .font(.pretendard(.medium, size: 12))
        .foregroundStyle(.gray00)
    }
  }

  var loginField: some View {
    VStack(spacing: 47) {
        TextField("아이디", text: $LoginViewModle.user.id)
        .textFieldStyle(BottomLineTextFieldStyle())

        SecureField("비밀번호", text: $LoginViewModle.user.password)
        .textFieldStyle(BottomLineTextFieldStyle())


      VStack {
        Button(action: {}, label: {
          Text("로그인하기")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .frame(height: 48)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .tint(.green00)

        Button("회원가입") {}
          .tint(.secondary)
          .padding(4)
      }
    }
  }

  var thirdPartyLoginField: some View {
    VStack(spacing: 8) {
        Button(action: {}, label: {
          Text("카카오로 로그인")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .leading) {
              Image("KakaoLogo")
                .padding(.leading, 4)
            }
        })
      .frame(height: 48)
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .tint(.yellow)
      .foregroundStyle(.black)

      Button(action: {}, label: {
        Text("Apple로 로그인")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .overlay(alignment: .leading) {
            Image("AppleLogo")
              .padding(.leading, 4)
          }
      })
      .frame(height: 48)
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .tint(.black)
      .foregroundStyle(.white)

    }
  }
}

#Preview {
    LoginView()
}

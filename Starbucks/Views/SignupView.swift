//
//  SignupView.swift
//  Starbucks
//
//  Created by 김도연 on 3/29/25.
//

import SwiftUI

struct SignupView: View{
    @StateObject private var signupViewModel = SignupViewModel()
    
    @AppStorage("nickname") private var storedNickname = ""
    @AppStorage("email") private var storedEmail = ""
    @AppStorage("password") private var storedPassword = ""

    @FocusState private var focusedField: Field?
    
    enum Field{
        case nickname
        case email
        case password
    }

    var body: some View {
        VStack{
            Spacer()
                .frame(maxHeight : 212)
            SignupField
        }
        .padding()
    }
    
    var SignupField: some View {
        VStack(spacing: 49){
            VStack{
                TextField("닉네임", text: $signupViewModel.signup.nickname)
                    .focused($focusedField, equals: .nickname)
                    .autocapitalization(.none)
                Divider()
                    .frame(height: 1)
                    .background(focusedField == .nickname ? Color.green00: Color.gray00)
            }
            
            VStack{
                TextField("이메일", text: $signupViewModel.signup.email)
                    .focused($focusedField, equals: .email)
                    .autocapitalization(.none)
                Divider()
                    .frame(height: 1)
                    .background(focusedField == .email ? Color.green00: Color.gray00)
            }
            
            VStack{
                SecureField("비밀번호", text: $signupViewModel.signup.password)
                    .focused($focusedField, equals: .password)
                    .autocapitalization(.none)
                Divider()
                    .frame(height: 1)
                    .background(focusedField == .password ? Color.green00: Color.gray00)
            }
            
            Spacer()
                .frame(maxHeight : 428)
            
            Button(action: {
                storedNickname = signupViewModel.signup.nickname
                storedEmail = signupViewModel.signup.email
                storedPassword = signupViewModel.signup.password
            }, label: {
              Text("회원가입하기")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
            .frame(height: 48)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.green00)
        }
    }
}

#Preview {
    SignupView()
}

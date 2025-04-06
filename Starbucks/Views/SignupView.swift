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
    
    @Environment(\.dismiss) private var dismiss
    
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
        .navigationTitle("회원가입")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backbutton)
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
                if  signupViewModel.signup.nickname.count > 0 &&
                    signupViewModel.signup.email.count > 0 &&
                    signupViewModel.signup.password.count > 0 {
                    
                    
                    storedNickname = signupViewModel.signup.nickname
                    storedEmail = signupViewModel.signup.email
                    storedPassword = signupViewModel.signup.password
                    
                    dismiss()
                }else{
                    
                }
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
    
    var backbutton: some View{
        Button{
            self.dismiss()
        }label: {
            Image(systemName: "chevron.left")
                .font(.title3)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SignupView()
}

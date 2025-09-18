//
//  LoginView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/18.
//

import SwiftUI

struct LoginView: View {
    
    let authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                // Image
                BrandImage()
                
                // Form
                VStack(spacing: 24) {
                    InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                    InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                }
                
                // Button
                BasicButton(label: "ログイン", icon: "arrow.right") {
                    Task {
                        await authViewModel.login(email: email, password: password)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                // Navidation
                NavigationLink {
                    RegistrationView(authViewModel: authViewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("まだアカウントを持ちでない方")
                        Text("会員登録")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color(.darkGray))
                }
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}

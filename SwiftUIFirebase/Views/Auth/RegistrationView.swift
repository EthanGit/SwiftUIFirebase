//
//  RegistrationView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/18.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var age = 18
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // Image
            BrandImage(size: .large)
            
            // Form
            VStack(spacing: 24) {
                InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                InputField(text: $name, label: "お名前", placeholder: "入力してください")
                PickerField(selection: $age, title: "年齢")
                InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                InputField(text: $confirmPassword, label: "パスワード(確認用)", placeholder: "もう一度、入力してください", isSecureField: true)
            }
            
            // Button
            BasicButton(label: "登録", icon: "arrow.right") {
                Task {
                    await authViewModel.createAccount(
                        email: email,
                        password: password,
                        name: name,
                        age: age)
                }
            }
            .padding(.top, 24)

            Spacer()
            
            // Navidation
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("すでにアカウントを持ちでない方")
                    Text("ログイン")
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color(.darkGray))
            }

        }
        .padding(.horizontal)
    }
}

#Preview {
    RegistrationView()
}

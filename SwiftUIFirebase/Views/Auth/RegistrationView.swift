//
//  RegistrationView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/18.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var age = 18
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // Image
            BrandImage()
            
            // Form
            VStack(spacing: 24) {
                InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                InputField(text: $name, label: "お名前", placeholder: "入力してください")
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("年齢")
                            .foregroundStyle(Color(.darkGray))
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Picker(selection: $age) {
                            ForEach(18..<100) { number in
                                Text("\(number)")
                                    .tag(number)
                            }
                        } label: {
                            Text("年齢")
                        }
                        .tint(.black)
                    }
                    
                    Divider()
                }
                InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                InputField(text: $confirmPassword, label: "パスワード(確認用)", placeholder: "もう一度、入力してください", isSecureField: true)
            }
            
            // Button
            BasicButton(label: "登録", icon: "arrow.right") {
                print("登録ボタンをタップしました")
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

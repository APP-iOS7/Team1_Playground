//
//  PasswordView.swift
//  TwentyNineCM
//
//  Created by 맨태 on 3/5/25.
//

import SwiftUI

struct PasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var passwordText: String = ""
    @State private var passwordConfirmText: String = ""
    @FocusState private var topIsFocused: Bool
    @FocusState private var bottomIsFocused: Bool
    
    private var process: SignUpProcess = .shared
    
    private var isAlphabet: Bool {
        return passwordText.range(of: "[a-zA-z]", options: .regularExpression) != nil
    }
    
    private var isNumber: Bool {
        return passwordText.range(of: "[0-9]", options: .regularExpression) != nil
    }
    
    private var equalPassword: Bool {
        return passwordText == passwordConfirmText && !passwordText.isEmpty
    }
    
    private var textCounter: Bool {
        return passwordText.count > 7 && passwordText.count < 21
    }
    
    private var isActivate: Bool {
        return isAlphabet && isNumber && textCounter && equalPassword
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ProgressView(value: process.currentIndex / process.endIndex)
                    .tint(.black)
                
                Spacer()
                    .frame(height: 30)
                
                Text("로그인에 사용할\n비밀번호를 입력해주세요.")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer().frame(height: 30)
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(topIsFocused ? .black : inactiveColor,
                            lineWidth: 1)
                    .frame(height: 50)
                    .overlay {
                        TextField("비밀번호 입력", text: $passwordText)
                            .focused($topIsFocused)
                            .padding()
                    }
                
                HStack {
                    Section {
                        Text("영문포함")
                        Image(systemName: "checkmark")
                    }
                    .foregroundStyle(isAlphabet ? .blue : .gray)
                    
                    Spacer().frame(width: 15)
                    
                    Section {
                        Text("숫자포함")
                        Image(systemName: "checkmark")
                    }
                    .foregroundStyle(isNumber ? .blue : .gray)
                    
                    Spacer().frame(width: 15)
                    
                    Section {
                        Text("8-20자이내")
                        Image(systemName: "checkmark")
                    }
                    .foregroundStyle(textCounter ? .blue : .gray)
                }
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(topIsFocused ? .black : inactiveColor,
                            lineWidth: 1)
                    .frame(height: 50)
                    .overlay {
                        TextField("비밀번호 확인", text: $passwordConfirmText)
                            .focused($topIsFocused)
                            .padding()
                    }
                
                HStack {
                    Text("비밀번호 일치")
                    Image(systemName: "checkmark")
                }
                .foregroundStyle(equalPassword ? .blue : .gray)
                
                NavigationLink(destination: PasswordView(), label: {
                    Text("다음")
                })
                .disabled(isActivate)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(isActivate ? .blue : inactiveColor)
                .background(.blue)
                .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                    })
                    .tint(.black)
                })
            }
            .onAppear {
                process.currentIndex = 3.0
            }
        }
    }
}

#Preview {
    PasswordView()
}

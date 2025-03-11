//
//  EmailView.swift
//  TwentyNineCM
//
//  Created by 맨태 on 2/28/25.
//

import SwiftUI

struct EmailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var emailText: String = ""
    @FocusState private var isFocused: Bool
    
    private var process: SignUpProcess = .shared
    private var isValidEmail: Bool {
        let emailRegex: String = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let predicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: emailText)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ProgressView(value: process.currentIndex / process.endIndex)
                    .tint(.black)
                
                Spacer()
                    .frame(height: 30)
                
                Text("로그인에 사용할\n아이디를 입력해주세요.")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer().frame(height: 30)
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(isFocused ? .black : inactiveColor,
                            lineWidth: 1)
                    .frame(height: 50)
                    .overlay {
                        HStack {
                            TextField("아이디 (이메일) 입력", text: $emailText)
                                .focused($isFocused)
                            
                            Spacer()
                            
                            if (!emailText.isEmpty) {
                                Image(systemName: "xmark.circle.fill")
                                    .onTapGesture {
                                        emailText = ""
                                    }
                            }
                        }
                        .padding(10)
                    }
                
                Spacer().frame(height: 40)
                
                NavigationLink(destination: PasswordView(), label: {
                    Text("다음")
                })
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .disabled(!isValidEmail)
                .background(isValidEmail ? .blue : inactiveColor)
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
                process.currentIndex = 2.0
            }
        }
    }
}

#Preview {
    EmailView()
}

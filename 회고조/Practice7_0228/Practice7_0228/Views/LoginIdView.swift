//
//  LoginIdView.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import SwiftUI

struct LoginIdView: View {
    @ObservedObject var viewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            VStack {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.35)
                        .tint(Color.black)
                        .frame(width: 360)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        Text("로그인에 사용할")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("아이디를 입력해주세요.")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 20)
                }
                VStack(alignment: .center) {
                    HStack {
                        TextField("Id", text: $viewModel.user.id, prompt: Text("아이디 (이메일) 입력"))
                            .padding()
                            .frame(width: 360, height: 50)
                            .border(.secondary)
                            .padding(.bottom, 40)
                            .keyboardType(.emailAddress)//이메일 받기
                            .autocapitalization(.none) // 대문자 설정 지우기
                            .disableAutocorrection(false) // 자동 수정 설정 해제
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                                
                            }
                        if viewModel.user.id != "" {
                            
                            
                        }
                    }
                    
                    NavigationLink {
                        if viewModel.nextId() {
                            LoginPasswordView(viewModel: viewModel)
                        }
                    } label: {
                            RoundedRectangle(cornerRadius: 0)
                                .fill(viewModel.nextId() ? Color.blue : Color.gray)
                                .frame(width: 360, height: 50)
                                .overlay(
                                    Text("다음")
                                        .foregroundStyle(Color.white)
                                    )
                        }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color.black)
                    })
                })
            }
        
    }
}

#Preview {
    LoginIdView(viewModel: UserViewModel(user: User()))
}

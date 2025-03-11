//
//  LoginPasswordView.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import SwiftUI

struct LoginPasswordView: View {
    @ObservedObject var viewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var passwordCheck: String = ""
    var body: some View {
        
        VStack(alignment: .leading) {
            ProgressView(value: 0.6)
                .tint(Color.black)
                .frame(width: 360)
                .padding(.bottom, 10)
            VStack(alignment: .leading) {
                HStack {
                    Text("로그인에 사용할")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Text("비밀번호를 입력해주세요.")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 20)
            
            SecureField("pass", text: $viewModel.user.password, prompt: Text("비밀번호 입력"))
                .padding()
                .frame(width: 360, height: 50)
                .border(.secondary)
                .autocapitalization(.none) // 대문자 설정 지우기
                .disableAutocorrection(false) // 자동 수정 설정 해제
                .padding(.bottom, 5)
            
            HStack {
                Text("영문포함")
                    .foregroundStyle(viewModel.ispassEng() ? Color.blue : Color.gray)
                Image(systemName: "checkmark")
                    .foregroundStyle(viewModel.ispassEng() ? Color.blue : Color.gray)
                
                Text("숫자포함")
                    .foregroundStyle(viewModel.ispassNum() ? Color.blue : Color.gray)
                Image(systemName: "checkmark")
                    .foregroundStyle(viewModel.ispassNum() ? Color.blue : Color.gray)
                
                Text("8~20자 이내")
                    .foregroundStyle(viewModel.ispassCount() ? Color.blue : Color.gray)
                Image(systemName: "checkmark")
                    .foregroundStyle(viewModel.ispassCount() ? Color.blue : Color.gray)
            }
            
            SecureField("passCheck", text: $passwordCheck, prompt: Text("비밀번호 확인"))
                .padding()
                    .frame(width: 360, height: 50)
                    .autocapitalization(.none) // 대문자 설정 지우기
                    .disableAutocorrection(false) // 자동 수정 설정 해제
                    .border(.secondary)
                    .padding(.bottom, 5)
            HStack {
                Text("비밀번호 일치")
                    .foregroundStyle(viewModel.nextPassword(passwordCheck) ? Color.blue : Color.gray)
                Image(systemName: "checkmark")
                    .foregroundStyle(viewModel.nextPassword(passwordCheck) ? Color.blue : Color.gray)
            }
            
            NavigationLink {
                if viewModel.nextPassword(passwordCheck) {
                    NextView()
                }
            } label: {
                RoundedRectangle(cornerRadius: 0)
                    .fill(viewModel.nextPassword(passwordCheck) ? Color.blue : Color.gray)
                    .frame(width: 360, height: 50)
                    .overlay(
                        Text("다음")
                            .foregroundStyle(Color.white)
                    )
            }
            Spacer()
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
    LoginPasswordView(viewModel: UserViewModel(user: User()))
}

//
//  AgreementView.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import SwiftUI

struct AgreementView: View {
    @ObservedObject var viewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            VStack {
                VStack(alignment: .leading) {
                    ProgressView(value: 0.2)
                        .tint(Color.black)
                        .frame(width: 360)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("29CM")
                                .font(.title2)
                                .fontWeight(.heavy)
                            Text("서비스 이용약관에")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        Text("동의해주세요.")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 40)
                    HStack {
                        Button {
                            viewModel.user.isAllagree.toggle()
                            viewModel.allAgree()
                        } label: {
                            if viewModel.user.isAllagree {
                                Image(systemName: "checkmark.square.fill")
                                    .foregroundStyle( Color.blue )
                                    .font(.headline)
                            } else {
                                Image(systemName: "checkmark.square")
                                    .foregroundStyle( Color.gray.opacity(0.5))
                                    .font(.headline)
                            }
                        }
                        Text("모두 동의(선택 정보 포함)")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                    }
                    .padding(.bottom, 10)
                }
                Divider()
                    .frame(width: 360)
                VStack(alignment: .leading) {
                    HStack {
                        Button {
                            viewModel.user.is14.toggle()
                            viewModel.someAgree()
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(viewModel.user.is14 ? Color.blue : Color.gray.opacity(0.5))
                                .font(.headline)
                            
                        }
                        Text("[필수] 만 14세 이상")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                    }
                    .padding(.top, 10)
                    HStack {
                        Button {
                            viewModel.user.isService.toggle()
                            viewModel.someAgree()
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(viewModel.user.isService ? Color.blue : Color.gray.opacity(0.5))
                                .font(.headline)
                            
                        }
                        Text("[필수] 이용약관 동의")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                        Text("보기")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                            .underline()
                    }
                    .padding(.top, 5)
                    HStack {
                        Button {
                            viewModel.user.isPrivate.toggle()
                            viewModel.someAgree()
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(viewModel.user.isPrivate ? Color.blue : Color.gray.opacity(0.5))
                                .font(.headline)
                            
                        }
                        Text("[필수] 개인정보 처리방침 동의")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                        Text("보기")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                            .underline()
                    }
                    .padding(.top, 5)
                    HStack {
                        Button {
                            viewModel.user.isAd.toggle()
                            viewModel.someAgree()
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(viewModel.user.isAd ? Color.blue : Color.gray.opacity(0.5))
                                .font(.headline)
                            
                        }
                        Text("[선택] 광고성 정보 수신 및 마케팅 활용 동의")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                        Text("보기")
                            .foregroundStyle(Color.black.opacity(0.8))
                            .font(.subheadline)
                            .underline()
                    }
                    .padding(.top, 5)
                    Spacer()
                }
                .padding(.trailing, 35)
                
                NavigationLink {
                    if viewModel.nextAgree() {
                        LoginIdView(viewModel: viewModel)
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(viewModel.nextAgree() ? Color.blue : Color.gray)
                        .frame(width: 500, height: 60)
                        .overlay(
                            Text("동의하고 가입하기")
                                .foregroundStyle(Color.white)
                        )
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
    AgreementView(viewModel: UserViewModel(user: User()))
}

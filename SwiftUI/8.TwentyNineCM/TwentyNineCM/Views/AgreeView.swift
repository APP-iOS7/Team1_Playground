//
//  AgreeView.swift
//  TwentyNineCM
//
//  Created by 맨태 on 2/28/25.
//

import SwiftUI

var inactiveColor: Color = Color(uiColor: .lightGray)

struct AgreeView: View {
    @Environment(\.dismiss) private var dismiss
    private var process: SignUpProcess = .shared
    
    private var isAgreeAll: Bool {
        return process.user.isOver14 &&
            process.user.isPrivacyPolicyAgreed &&
            process.user.isServiceTermsAgreed &&
            process.user.isMarketingConsentGiven
    }
        
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    ProgressView(value: process.currentIndex / process.endIndex)
                        .tint(.black)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("29CM 서비스 이용 약관에\n동의해주세요.")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        Image(systemName: isAgreeAll ? "checkmark.square.fill" : "checkmark.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(
                                isAgreeAll ? .blue : inactiveColor
                            )
                            .onTapGesture {
                                process.user.isOver14.toggle()
                                process.user.isPrivacyPolicyAgreed.toggle()
                                process.user.isServiceTermsAgreed.toggle()
                                process.user.isMarketingConsentGiven.toggle()
                            }
                        
                        Text("모두 동의 (선택 정보 포함)")
                            .foregroundStyle(
                                isAgreeAll ? .black : inactiveColor
                            )
                            .fontWeight(
                                isAgreeAll ? .bold : .regular
                            )
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Divider()
                        .background(.gray)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(process.user.isOver14 ? .blue : inactiveColor)
                            .onTapGesture {
                                process.user.isOver14.toggle()
                            }
                        
                        Text("[필수] 만 14세 이상")
                            .fontWeight(process.user.isOver14 ? .bold : .regular)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(process.user.isServiceTermsAgreed ? .blue : inactiveColor)
                            .onTapGesture {
                                process.user.isServiceTermsAgreed.toggle()
                            }
                        
                        Text("[필수] 이용약관 동의")
                            .fontWeight(process.user.isServiceTermsAgreed ? .bold : .regular)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(process.user.isPrivacyPolicyAgreed ? .blue : inactiveColor)
                            .onTapGesture {
                                process.user.isPrivacyPolicyAgreed.toggle()
                            }
                        
                        Text("[필수] 개인정보 처리방침 동의")
                            .fontWeight(process.user.isPrivacyPolicyAgreed ? .bold : .regular)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundStyle(process.user.isMarketingConsentGiven ? .blue : inactiveColor)
                            .onTapGesture {
                                process.user.isMarketingConsentGiven.toggle()
                            }
                        
                        Text("[선택] 광고성 정보 수신 및 마케팅 활용 동의")
                            .fontWeight(process.user.isMarketingConsentGiven ? .bold : .regular)
                    }
                    
                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: EmailView(), label: {
                    Text("동의하고 가입하기")
                })
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .disabled(!(process.user.isOver14 &&
                            process.user.isPrivacyPolicyAgreed &&
                            process.user.isServiceTermsAgreed))
                .foregroundStyle(.white)
                .background(
                    Rectangle().fill(
                        process.user.isOver14 &&
                        process.user.isServiceTermsAgreed &&
                        process.user.isPrivacyPolicyAgreed
                        ? .blue : inactiveColor
                    )
                )
            }
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
        }
    }
}

#Preview {
    AgreeView()
    
}

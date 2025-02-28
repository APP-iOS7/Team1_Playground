//
//  TopLineView.swift
//  Practice6_0226
//
//  Created by 최하진 on 2/27/25.
//

import SwiftUI

struct TopLineView: View {
    @State private var pick : String = "입력 날짜"
    var body: some View {
        HStack {
            Text("일기")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(20)
            Spacer()
            Button(action: {
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
            })
            .buttonBorderShape(.circle)
            .buttonStyle(.bordered)
            Menu {
                Menu(content: {
                    Picker(selection: $pick, content: {
                        Text("입력 날짜").tag("입력 날짜")
                        Text("모멘트의 날짜").tag("모멘트의 날짜")
                    }, label: {
                        Text(" ")
                    })
                }, label: {
                    Image(systemName: "arrow.up.arrow.down")
                    Text("다음으로 정렬")
                    Text(pick)
                })
                Section {
                    Button(action: {}, label: {
                        Image(systemName: "calendar.badge.checkmark")
                        Text("심층분석")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "bell")
                        Text("알림")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "brain.head.profile")
                        Text("건강접근")
                    })
                    Button(action: {}, label: {
                        Image(systemName: "lock")
                        Text("일기 잠그기")
                    })
                }
                Section {
                    Button(action: {}, label: {
                        Image(systemName: "printer")
                        Text("프린트")
                    })
                }
            } label: {
                Circle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 37, height: 37)
                    .overlay(
                        Image(systemName: "ellipsis")
                            .font(.subheadline)
                            .foregroundStyle(Color.black)
                    )
                
            }
            .padding(.trailing, 20)
        }
        .padding(.top, 40)
    }
}

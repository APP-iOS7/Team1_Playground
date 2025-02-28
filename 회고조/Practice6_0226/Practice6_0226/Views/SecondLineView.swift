//
//  SecondLineView.swift
//  Practice6_0226
//
//  Created by 최하진 on 2/27/25.
//

import SwiftUI
struct SecondLineView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "rectangle.stack.fill")
                        .foregroundStyle(Color.indigo)
                        .font(.caption)
                    Text("올해 입력 항목")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                Text("1개")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Divider()
                .frame(height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "quote.opening")
                        .foregroundStyle(Color.pink.opacity(0.6))
                        .font(.subheadline)
                    Text("단어 수")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                Text("7단어")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Divider()
                .frame(height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundStyle(Color.indigo)
                        .font(.subheadline)
                    Text("일기 쓴 일수")
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                Text("1일")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(.leading, 25)
    }
}

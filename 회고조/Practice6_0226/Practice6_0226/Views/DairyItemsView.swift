//
//  DairyItemsView.swift
//  Practice6_0226
//
//  Created by 최하진 on 2/27/25.
//

import SwiftUI

struct DairyItemsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘")
                .fontWeight(.semibold)
                .font(.title2)
                .padding(.leading,20)
                .padding(.bottom,10)
            LazyVGrid(columns: [GridItem(.flexible())], alignment: .center) {
                VStack(alignment: .leading) {
                    Text("제목")
                        .fontWeight(.heavy)
                        .font(.headline)
                        .padding(.top, 10)
                    Text("내용")
                        .padding(.bottom,5)
                    Divider()
                        .frame(width: 340)
                    HStack{
                        Text("2월 21일 금요일")
                            .foregroundStyle(Color.gray)
                            .font(.callout)
                        Spacer()
                        Image(systemName: "ellipsis")
                    }
                }
                .padding(.leading, 50)
                .padding(.trailing, 40)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 360, height: 120)
                        .shadow(color: .gray.opacity(0.4), radius: 8, x: 5, y: 0)
                }
            }
        }
        .padding(.top, 20)
    }
}

//
//  DiaryCell.swift
//  Diary
//
//  Created by 맨태 on 2/26/25.
//

import SwiftUI

struct DiaryCell: View {
    var diary: Diary
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .gray.opacity(0.3), radius: 15, x: 2, y: 2)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(diary.title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text(diary.content)
                    .font(.system(size: 20))
                Divider().padding(.top, 15)
                HStack {
                    Text(diary.date)
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        
    }
}

#Preview {
    DiaryCell(diary: Diary(title: "안녕", content: "안녕하세요", date: "2월 21일 금요일"))
}

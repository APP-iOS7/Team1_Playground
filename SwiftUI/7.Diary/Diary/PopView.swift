//
//  PopView.swift
//  Diary
//
//  Created by 맨태 on 2/27/25.
//

import SwiftUI

struct PopView: View {
    var body: some View {
        
        VStack {
            PopViewCell(leftIcon: "chevron.right",
                        title: "다음으로 정렬",
                        subTitle: "입력 날짜",
                        rightIcon: "arrow.up.arrow.down")
            
            Rectangle()
                .fill(Color(uiColor: .systemGray6))
                .frame(height: 10)
            
            PopViewCell(title: "심층 분석", rightIcon: "keyboard")
            
            Divider()
                .background(Color(uiColor: .systemGray6))
            
            PopViewCell(title: "알림",rightIcon: "bell")
            
            Divider()
                .background(Color(uiColor: .systemGray6))
            
            PopViewCell(title: "건강 접근", rightIcon: "brain.head.profile")
            
            Divider()
                .background(Color(uiColor: .systemGray6))
            
            PopViewCell(title: "일기 잠그기", rightIcon: "lock")
            
            Divider()
                .background(Color(uiColor: .systemGray6))
            
            PopViewCell(title: "프린트", rightIcon: "printer")
        }
        .padding()
        .frame(width: 250)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5),radius: 15, y: 15)
        )
        
    }
}

struct PopViewCell: View {
    let leftIcon: String?
    let title: String
    let subTitle: String?
    let rightIcon: String
    
    init(leftIcon: String? = nil, title: String, subTitle: String? = nil, rightIcon: String) {
        self.leftIcon = leftIcon
        self.title = title
        self.subTitle = subTitle
        self.rightIcon = rightIcon
    }
    
    var body: some View {
        HStack {
            if let leftIcon {
                Image(systemName: leftIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            } else {
                Color.clear
                    .frame(width: 20, height: 20)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                
                if let subTitle {
                    Text(subTitle)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            Image(systemName: rightIcon)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

#Preview {
    PopView()
}

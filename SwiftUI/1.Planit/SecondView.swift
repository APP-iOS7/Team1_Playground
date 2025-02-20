//
//  SecondView.swift
//  Planit
//
//  Created by 맨태 on 2/11/25.
//

import SwiftUI

struct SecondView: View {
    @Binding var thirdViewIsShowing: Bool
    let dateString: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(dateString)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("오늘")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Image(systemName: "face.smiling")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color(UIColor.lightGray))
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    thirdViewIsShowing = true
                }
            }, label: {
                HStack {
                    Text("+ 할 일을 추가하세요")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                    Spacer()
                }
            })
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(UIColor.systemGray6))
            )
        }
        .padding(20)
    }
}

#Preview {
    //SecondView(dateString: "2월 11일(화)")
}

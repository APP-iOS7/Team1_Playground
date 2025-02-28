//
//  WritingView.swift
//  Diary
//
//  Created by 맨태 on 2/26/25.
//

import SwiftUI

struct WritingView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top, content: {
            VStack {
                Text("2월 21일 금요일")
                    .font(.title3)
                    .fontWeight(.bold)
                
                TextField("제목", text: $title)
                
                Divider()
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $content)
                    
                    if content.isEmpty {
                        Text("글쓰기 시작...")
                            .foregroundStyle(.gray)
                            .padding(.top, 5)
                    }
                }
            }
            
            VStack {
                HStack(spacing: 20) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bookmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    })
                    .tint(.indigo)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    })
                    .tint(.indigo)
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("완료")
                            .fontWeight(.bold)
                    })
                    .tint(.indigo)
                }
                
                Spacer()
            }
        })
        .padding()
    }
}

#Preview {
    WritingView()
}

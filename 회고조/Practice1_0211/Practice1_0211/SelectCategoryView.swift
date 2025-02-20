//
//  SelectCategoryView.swift
//  Practice1_0211
//
//  Created by 최하진 on 2/11/25.
//

import SwiftUI
enum Field {
    case task
    case email
  }
struct SelectCategoryView: View {
    var title: String = ""
    var color: Color = .blue
    @Environment(\.dismiss) private var dismiss
    @State private var task : String = ""
    @FocusState var focusField: Bool
    var body: some View {
            VStack {
                TextField("할 일을 입력하세요", text: $task)
                    .font(.headline)
                    .fontWeight(.bold)
                    .focused($focusField)
                HStack{
                    Image(systemName: "calendar")
                        .foregroundStyle(color.opacity(0.6))
                    Text("오늘")
                        .foregroundStyle(color.opacity(0.6))
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bell")
                            .foregroundStyle(color.opacity(0.6))
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "list.clipboard")
                            .foregroundStyle(color.opacity(0.6))
                        Text(title)
                    })
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(color.opacity(0.6))
                    })
                }
            }
            .padding(20)
            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now()-1) {
                        self.focusField = true
//                    }
            }

    }
}

#Preview {
    SelectCategoryView(title: "할 일", color: .blue)
}

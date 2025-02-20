//
//  DailyView.swift
//  Practice1_0211
//
//  Created by 최하진 on 2/11/25.
//

import SwiftUI

struct Cate : Hashable {
    var name : String
    var color : Color
}
struct DailyView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingTextField: Bool = false
    @State private var todoList: [String] = []
    @State private var category: [Cate] = [Cate(name: "할일", color: .blue), Cate(name: "중요", color: .red), Cate(name: "기념일", color: .green)]
    @State private var isCategoryShowing = false
    var body: some View {
        ZStack{
            VStack{
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("2월 11일 (화)")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("오늘")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
                    Image(systemName: "face.smiling")
                        .font(.headline)
                        .foregroundStyle(Color.gray)
                    
                }.padding(20)
                
//                List {
//                    
//                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.95))
                    .frame(width: 280, height: 40, alignment: .bottom)
                    .padding(10)
                    .overlay(alignment: .leading, content: {
                        HStack{
                            Image(systemName: "plus")
                                .padding(.leading)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Text("할 일을 추가하세요")
                                .foregroundStyle(.gray)
                        }
                    })
                    .onTapGesture {
                        isCategoryShowing.toggle()
                    }
                if isCategoryShowing {
                    NewView
                        .frame(width: 360, height: 130)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 15)
                        )
                        .onTapGesture {
                            isCategoryShowing.toggle()
                        }
                }
                
            }
        }
        
    }
    
    private var NewView: some View {
        var title : String = ""
        var color : Color = .blue
        return VStack (alignment: .leading){
            HStack{
                Text("카테고리 선택")
                Spacer()
                Text("편집")
                    .foregroundStyle(Color.blue)
            }
            .padding(15)
           
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(category, id: \.self) { cate in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.95))
                        .frame(width: 70, height: 70)
                        
                        .overlay(alignment: .center, content: {
                            VStack{
                                Circle()
                                    .frame(width: 18, height: 18)
                                Text(cate.name)
                            }
                        })
                        .foregroundStyle(cate.color.opacity(0.6))
                        .onTapGesture(perform: {
                            isShowingTextField.toggle()
                            title = cate.name
                            color = cate.color
                            
                        })
                        
                    
                }
            }
            .padding(.bottom)
            .padding(18)
        }
        .sheet(isPresented: $isShowingTextField, content: {
            SelectCategoryView(title: title, color: color)
                .presentationDetents([.small])
                .onDisappear(perform: {
                    isCategoryShowing.toggle()
                })
        })
    }
}

extension PresentationDetent {
    static let small = Self.height(100)
    static let extraLarge = Self.fraction(0.75)
}

#Preview {
    DailyView()
}

//
//  ContentView.swift
//  Diary
//
//  Created by 맨태 on 2/26/25.
//

import SwiftUI

let diarys: [Diary] = [
    Diary(title: "하나", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "둘", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "셋", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "넷", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "다섯", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "여섯", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "일곱", content: "안녕하세요", date: "2월 21일 금요일"),
    Diary(title: "여덟", content: "안녕하세요", date: "2월 21일 금요일")
]

struct ContentView: View {
    @State private var writingViewIsShow: Bool = false
    @State private var popViewIsShow: Bool = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .ignoresSafeArea()
                .onTapGesture {
                    popViewIsShow = false
                }
            
            ScrollView {
                VStack(spacing: 0) {
                    topView
                    infomationView
                    HStack {
                        Text("오늘")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ForEach(diarys) { diary in
                        DiaryCell(diary: diary)
                            .padding(.top, 20)
                    }
                }
            }
            .padding()
            
            floatingButton
        }
        .sheet(isPresented: $writingViewIsShow, content: {
            WritingView()
        })
        .overlay {
            if popViewIsShow {
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .ignoresSafeArea()
                        .contentShape(Rectangle()) // 없으면 터치가 안먹는다
                        .onTapGesture {
                            popViewIsShow = false
                        }
                    
                    PopView()
                        .offset(x: 55, y: -150)
                }
            }
        }
    }
    
    private var topView: some View {
        HStack(spacing: 25) {
            Text("일기")
                .font(.system(size: 50))
                .fontWeight(.bold)
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .fontWeight(.bold)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            })
            .frame(width: 45, height: 45)
            .background(
                Circle().fill(Color(uiColor: .systemGray5))
            )
            .tint(.black)
            Menu(" ") {
                Menu(" ") {
                    
                }
                
            }
            .frame(width: 45, height: 45)
            .overlay(content: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            })
            .background(
                Circle().fill(Color(uiColor: .systemGray5))
            )
            .tint(.black)
        }
    }
    
    private var infomationView: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "rectangle.stack.fill")
                        .foregroundStyle(.indigo.opacity(0.8))
                    Text("올해 입력 항목")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Text("1개")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Divider().frame(height: 40)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "quote.opening")
                        .foregroundStyle(.red)
                    Text("단어 수")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Text("7단어")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Divider().frame(height: 40)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundStyle(.indigo)
                    Text("일기 쓴 일수")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                Text("1일")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .frame(height: 80)
    }
    
    private var floatingButton: some View {
        VStack {
            Spacer()
            
            Button(action: {
                writingViewIsShow = true
            }, label: {
                
                Image(systemName: "plus")
                    .resizable()
                    .fontWeight(.bold)
                    .frame(width: 30, height: 30)
                
            })
            .frame(width: 100, height: 100)
            .tint(.indigo)
            .background(
                Circle()
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.5), radius: 15, y: 15)
            )
            
        }
    }
}

#Preview {
    ContentView()
}

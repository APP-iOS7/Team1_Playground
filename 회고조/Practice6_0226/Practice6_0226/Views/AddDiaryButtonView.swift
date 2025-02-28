//
//  AddDiaryButton.swift
//  Practice6_0226
//
//  Created by 최하진 on 2/27/25.
//

import SwiftUI

struct AddDiaryButtonView: View {
    @State private var isShowing: Bool = false
    @State private var isImportant: Bool = false
    @State private var title: String = ""
    @State private var itemBody: String = ""
    @FocusState var focused: Bool
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isShowing.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundStyle(Color.indigo)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .frame(width: 63,height: 63)
                                    .shadow(color: .gray.opacity(0.4), radius: 10, x: 5, y: 10)
                            )
                    })
                    .buttonBorderShape(.circle)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    Spacer()
                }
            }
            .sheet(isPresented: $isShowing) {
                VStack {
                    HStack {
                        Image(systemName: !isImportant ? "bookmark" : "bookmark.fill")
                            .foregroundStyle(!isImportant ? Color.indigo : Color.red)
                            .onTapGesture {
                                isImportant.toggle()
                            }
                            .padding(.trailing, 50)
                        Spacer()
                        Text(Date.now.formatted(
                            Date.FormatStyle()
                            .month()
                            .day()
                            .weekday(.wide)
                            .locale(Locale(identifier: "ko"))
                        ))
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(Color.indigo)
                            .padding(.trailing, 10)
                        Button("완료") {
                            isShowing.toggle()
                        }
                        .foregroundStyle(Color.indigo)
                    }
                    .padding(20)
                    TextField(text: $title, prompt: Text("제목").foregroundStyle(Color.gray)) {
                    }
                    .focused($focused)
                    .padding(.leading, 20)
                    Divider()
                        .frame(width: geometry.size.width - 20)
                    TextField(text: $itemBody, prompt: Text("글쓰기 시작...")) {
                    }
                    .padding(.leading, 20)
                    Spacer()
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.focused = true
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Image(systemName: "textformat.size.ko")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "photo.on.rectangle")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "camera")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "waveform")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "location")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "tree")
                                .font(.title3)
                            Spacer()
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Image(systemName: "textformat.size.ko")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "photo.on.rectangle")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "camera")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "waveform")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "location")
                                .font(.title3)
                            Spacer()
                            Image(systemName: "tree")
                                .font(.title3)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

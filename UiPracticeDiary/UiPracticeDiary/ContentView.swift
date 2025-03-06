//
//  ContentView.swift
//  UiPracticeDiary
//
//  Created by Sean on 2/26/25.
//

import SwiftUI
import SwiftData
import Foundation

@Model
class Diary: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var content: String
    var date: Date = Date()
    
    init(/*id: UUID,*/ title: String, content: String, date: Date) {
//        self.id = id
        self.title = title
        self.content = content
        self.date = date
    }
}

struct ContentView: View {
    @State private var addNewDiary: Bool = false
//    @StateObject private var diaryPage = DiaryPageView()
    
    @Query private var diaries: [Diary] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeTitleView()
                    Spacer()
                    RecordView()
                    Spacer()
                    List {
                        ForEach(diaries) { diary in
                            DiaryCard(diary: diary)
                        }
                    }
                    Spacer()
                    Button(action: {
                        addNewDiary = true
                    }) {
                        Label("Add Diary", systemImage: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(isPresented: $addNewDiary) {
            DiaryPageView()
        }
        .padding(.all, 30)
    }
}

struct HomeTitleView: View {
    var body: some View {
        HStack {
            Text("일기")
            Spacer()
            Image(systemName: "magnifyingglass.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "ellipsis")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        .font(.largeTitle.bold())
    }
}

struct RecordView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("일기")
                }
                Text("일기")
            }
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("일기")
                }
                Text("일기")
            }
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("일기")
                }
                Text("일기")
            }
        }
    }
}

struct DiaryPageView: View {
    @Environment(\.modelContext) private var modelContext // 데이터 저장소에 접근할 수 있는 환경변수
    @Environment(\.dismiss) private var dismiss // 나를 호출한 뷰에서 닫기 기능을 동작 시키는 환경변수(클로저)
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("일기의 제목을 입력하세요.", text: $title)
                    TextEditor(text: $content)
                        .frame(minHeight: 100)
//                    TextField("일기의 내용을 입력하세요.", text: $content)
//                    TextEditor(text: $content)
//                        .frame(minHeight: 100)
                }
            }
            .navigationTitle(Date.now.formatted(Date.FormatStyle()
                .month()
                .day()
//                .weekday(.wide)
                .locale(Locale(identifier: "ko"))
            ))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("save") {
                        let newDiary = Diary(title: title, content: content, date: date)
                        modelContext.insert(newDiary)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct DiaryCard: View {
    let diary: Diary
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            Text(diary.title)
                .font(.headline)
            Text(diary.content)
                .font(.body)
                .lineLimit(3)
            Text(Date.now.formatted(Date.FormatStyle()
                .month()
                .day()
//                .weekday(.wide)
                .locale(Locale(identifier: "ko"))
            ))
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1)))
    }
}

#Preview {
    ContentView()
}



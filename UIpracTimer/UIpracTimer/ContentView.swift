//
//  ContentView.swift
//  UIpracTimer
//
//  Created by Sean on 2/25/25.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}


import SwiftUI

struct ContentView: View {
    // 현재 시간과 날짜를 위한 상태
    @State private var currentTime = Date()
    
    // D-Day 카운트다운을 위한 예시 (임의로 18일로 설정)
    private let dDayCount = 18
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // 다크 모드 배경
                
                VStack(spacing: 20) {
                    // 상단 상태 바 (시간, 날짜, D-Day)
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(formattedTime)
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            Text("2.18. (화)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        Text("D-Day")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal)
                    
                    // 중앙 큰 타이머 (00:00:00)
                    Text("00:00:00")
                        .foregroundColor(.white)
                        .font(.system(size: 48, weight: .bold))
                        .padding()
                    
                    // 카테고리 및 타이머 리스트
                    VStack(spacing: 15) {
                        TimerRow(title: "운동", color: .orange)
                        TimerRow(title: "Flutter", color: .gray)
                        TimerRow(title: "Firebase", color: .yellow)
                        TimerRow(title: "UIKit", color: .blue)
                        TimerRow(title: "SwiftUI", color: .green)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // 하단 버튼 및 네비게이션 바
                    HStack(spacing: 20) {
                        Button(action: {
                            // 기록 추가 기능 구현
                        }) {
                            Text("+ 기록")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        Button(action: {
                            // To-do 추가 기능 구현
                        }) {
                            Text("+ To-do")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true) // 네비게이션 바 숨김
        }
    }
    
    // 현재 시간을 포맷팅하는 함수
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: currentTime)
    }
}

// 카테고리 및 타이머를 표시하는 재사용 가능한 뷰
struct TimerRow: View {
    let title: String
    let color: Color
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 16))
            Spacer()
            Text("00:00:00")
                .foregroundColor(.white)
                .font(.system(size: 14))
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // 다크 모드 미리보기
    }
}

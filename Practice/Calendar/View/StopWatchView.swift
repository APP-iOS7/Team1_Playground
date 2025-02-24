import SwiftUI

struct StopWatchView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("00:00.00")
                    .font(.system(size: 60))
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        print("구간 기록 버튼 누름")
                    }) {
                        Text("구간 기록")
                            .frame(width: 100, height: 50)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    
                    Button(action: {
                        print("시작 버튼 누름")
                    }) {
                        Text("시작")
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                }
                .padding()
                
                HStack(spacing: 15) {
                    Button("알람") {
                        print("알람 버튼 누름")
                    }
                    Button("세계 시간") {
                        print("세계 시간 버튼 누름")
                    }
                    Button("스톱워치") {
                        print("스톱워치 버튼 누름")
                    }
                    Button("타이머") {
                        print("타이머 버튼 누름")
                    }
                }
                .padding()
            }
            
            VStack {
                HStack {
                    Spacer()
                    Menu {
                        Text("메뉴1")
                        Text("메뉴2")
                        Text("메뉴3")
                    } label: {
                        Label("", systemImage: "ellipsis") // ellipsis 아이콘 사용
                            .rotationEffect(.degrees(90))
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    StopWatchView()
}

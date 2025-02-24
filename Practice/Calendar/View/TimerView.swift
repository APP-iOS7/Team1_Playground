import SwiftUI

struct TimerItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

struct TimerView: View {
    @State private var timers: [TimerItem] = [
        TimerItem(title: "운동", color: .orange),
        TimerItem(title: "flutter", color: .gray),
        TimerItem(title: "firebase", color: .yellow),
        TimerItem(title: "UIKit", color: .blue),
        TimerItem(title: "swiftUI", color: .teal)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // 날짜와 타이머 표시
                VStack {
                    Text(Date(), style: .date)
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Text("00:00:00")
                        .font(.largeTitle)
                        .bold()
                }
                .padding()
                
                // 타이머 목록
                List(timers) { timer in
                    HStack {
                        Circle()
                            .fill(timer.color)
                            .frame(width: 20, height: 20)
                        
                        Text(timer.title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("00:00:00")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
                
                // 추가 버튼
                HStack {
                    Button(action: {
                        timers.append(TimerItem(title: "새 타이머", color: .purple))
                    }) {
                        Text("+ 과목")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
                    Button(action: {}) {
                        Text("+ To-do")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarTitle("D-Day", displayMode: .inline)
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

#Preview {
    TimerView()
}



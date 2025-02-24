import SwiftUI

struct AlarmView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 50) {
                    HStack {
                        Button(action: {
                        }) {
                            Text("프리미엄")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .padding(10)
                                .background(Color.red)
                                .cornerRadius(40)
                        }
                        Spacer()
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("다음 알람 >")
                            .foregroundColor(.gray)
                            .padding(.leading)
                        
                        Text("2일 후에 울려요")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                    }
                    
                    VStack(spacing: 10) {
                        HStack {
                            Image(systemName: "music.note")
                                .foregroundColor(.yellow)
                                .padding(.leading, 10)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("과학적인 사운드로 평정 자기")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                Text("수면 분석 켜기")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .padding(.trailing, 10)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 10) {
                        AlarmCard(time: "오전 8:58", isEnabled: true)
                        AlarmCard(time: "오전 8:45", isEnabled: false)
                        AlarmCard(time: "오전 8:57", isEnabled: false)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack(spacing: 40) {
                        Spacer()
                        Image(systemName: "alarm.fill")
                            .foregroundColor(.white)
                        Image(systemName: "moon.fill")
                            .foregroundColor(.white)
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.white)
                        Image(systemName: "chart.bar.fill")
                            .foregroundColor(.white)
                        Image(systemName: "gear")
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .padding()
                    .background(Color.black.opacity(0.8))
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct AlarmCard: View {
    @State private var isEnabled: Bool // 토글 상태를 관리하기 위한 State
    
    let time: String
    
    init(time: String, isEnabled: Bool) {
        self.time = time
        self._isEnabled = State(initialValue: isEnabled) // 초기값 설정
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("일 월 화 수 목 금 토")
                    .foregroundColor(.cyan)
                    .font(.caption)
                Text(time)
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
            }
            Spacer()
            Toggle("", isOn: $isEnabled) // 토글 스위치 추가
                .labelsHidden() // 라벨 숨김 (아이콘으로 대체 가능)
                .toggleStyle(SwitchToggleStyle(tint: isEnabled ? .blue : .gray)) // 토글 색상 설정
                .padding(5)
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    AlarmView()
}

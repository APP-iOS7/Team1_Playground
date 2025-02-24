import SwiftUI

struct CalendarView: View {
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]  // 요일 배열
    let days = (1...31).map { String($0) }  // 1일부터 31일까지 숫자 배열
    let columns = Array(repeating: GridItem(.flexible()), count: 7)  // 7개의 열 (일~토)
    
    @State private var selectedDay: String? = nil  // 선택된 날짜
    @State private var showPopup = false  // 팝업 표시 여부

    var body: some View {
        ZStack {
            VStack {
                // 요일 표시
                HStack(spacing: -23) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .frame(maxWidth: .infinity)
                            .font(.headline)
                            .padding(-10)
                    }
                }

                // 날짜 버튼 표시
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(days, id: \.self) { day in
                        Button(action: {
                            selectedDay = day
                            showPopup = true  // 팝업 표시
                        }) {
                            Text(day)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
            
            // 팝업 뷰
            if showPopup {
                ZStack {
                    Color.black.opacity(0.4)  // 반투명 배경
                        .ignoresSafeArea()
                        .onTapGesture {
                            showPopup = false  // 배경 터치 시 팝업 닫기
                        }
                    
                    VStack {
                        Text("Selected Day: \(selectedDay ?? "")")
                            .font(.title)
                            .padding()
                        
                        Button("Close") {
                            showPopup = false  // 팝업 닫기
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

//
//  ContentView.swift
//  alarm
//
//  Created by Sean on 2/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isToggled: Bool = false
    
    var body: some View {
        TabView {
            VStack {
                TabView {
                    ScrollView {
                        AlarmView()
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Home")
                    }
                    Spacer()
                }
                .padding()
            }
        }
        HStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
        }
//        .padding()
    }
}

struct AlarmView: View {
    @State private var isToggled: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("프리미엄")
                    .padding()
                Spacer()
                Image(systemName: "ellipsis")
                    .padding()
            }
            HStack {
                Text("다음 알람 >")
                    .padding()
                Spacer()
            }
            HStack {
                Text("2일 후에 울려요")
                    .padding()
                Spacer()
            }
            HStack {
                Image(systemName: "bed.double.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("과학적인 사운드로 꿀잠 자기")
                    Text("수면 분석 켜기")
                        .font(.title2.bold())
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
            .padding(.horizontal)
            HStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("일 월 화 수 목 금 토")
                        Text("오전 8:58")
                            .font(.title.bold())
                        Text("미션")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Toggle("", isOn: $isToggled)
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .padding(5)
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: 90))
                            .padding()
                    }
                    
                }
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
            .padding(.horizontal)
            HStack {
                Text("Hello, SwiftUI!")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 370, height: 100)
                            )
            }
            .padding()
            HStack {
                Text("Hello, SwiftUI!")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 370, height: 100)
                            )
            }
            .padding()
            HStack {
                Text("Hello, SwiftUI!")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 370, height: 100)
                            )
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}

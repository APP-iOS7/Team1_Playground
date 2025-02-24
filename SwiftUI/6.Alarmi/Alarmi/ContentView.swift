//
//  ContentView.swift
//  Alarmi
//
//  Created by 맨태 on 2/21/25.
//

import SwiftUI

let darkColor: Color = Color(red: 0.2, green: 0.23, blue: 0.25)
let lightColor: Color = Color(red: 0.29, green: 0.31, blue: 0.41)

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme
    let array: [String] = ["8:58", "8:45", "8:57", "9:01"]
    
    var body: some View {
        ZStack {
            TabView {
                alarmView
                    .tabItem {
                        Label("알람", systemImage: "clock.fill")
                    }
                
                Text("수면")
                    .tabItem {
                        Label("알람", systemImage: "moon")
                    }
                
                Text("아침")
                    .tabItem {
                        Label("아침", systemImage: "sun.max")
                    }
                
                Text("리포트")
                    .tabItem {
                        Label("리포트", systemImage: "list.bullet.rectangle.portrait")
                    }
                
                Text("설정")
                    .tabItem {
                        Label("설정", systemImage: "gearshape")
                    }
            }
//            .onAppear {
//                UITabBar.appearance().backgroundColor = .black
//                UITabBar.appearance().barTintColor = .black
//            }
            .foregroundStyle(.white)
            .tint(colorScheme == .light ? lightColor : .white)
            
            VStack(alignment: .trailing) {
                Color.clear
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(20)
                            .scaledToFit()
                    })
                    .frame(width: 70, height: 70)
                    .background(Circle().fill(.red))
                    .foregroundStyle(.white)
                }
            }
            .padding(.trailing, 10)
            .padding(.bottom, 80)
            .frame(maxWidth: .infinity)
        }
        
    }
    
    private var alarmView: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    HStack() {
                        Button(action: {}, label: {
                            HStack {
                                Text("다음 알람")
                                    .fontWeight(.bold)
                                Image(systemName: "chevron.right")
                            }
                            
                        })
                        .padding()
                        .frame(height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(colorScheme == .light ? lightColor : darkColor)
                        )
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("2일 후에 울려요")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(colorScheme == .light ? .black : .white)
                        Spacer()
                    }
                    
                    ForEach(array, id: \.self) { item in
                        CellView(time: item)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {}, label: {
                        Text("프리미엄")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    })
                        .padding()
                        .frame(height: 35)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.red)
                        )
                        .foregroundStyle(.white)
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "ellipsis")
                        .fontWeight(.bold)
                        .foregroundStyle(colorScheme == .light ? .black : .white)
                })
            }
        }
        
    }
}

struct CellView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isOn: Bool = false
    
    let time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("일")
                    .foregroundStyle(isOn ? .cyan.opacity(0.5) : .gray)
                Text("월")
                Text("화")
                Text("수")
                Text("목")
                Text("금")
                Text("토")
                    .foregroundStyle(isOn ? .cyan.opacity(0.5) : .gray)
            }
            .fontWeight(.bold)
            .foregroundStyle(isOn ? .cyan : .gray)
            
            HStack {
                Text("오전")
                    .font(.system(size: 40))
                    .foregroundStyle(isOn ? .white : .gray)
                Text(time)
                    .font(.system(size: 55))
                    .foregroundStyle(isOn ? .white : .gray)
                Toggle("", isOn: $isOn)
                    .tint(Color.cyan)
            
            }
            .fontWeight(.bold)
            
            HStack {
                Text("미션")
                    .foregroundStyle(isOn ? .white : .gray)
                Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundStyle(isOn ? .white : .gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(colorScheme == .light ? lightColor : darkColor)
        )
    }
}

#Preview {
    ContentView()
}

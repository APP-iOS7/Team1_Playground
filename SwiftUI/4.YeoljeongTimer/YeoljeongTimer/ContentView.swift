//
//  ContentView.swift
//  YeoljeongTimer
//
//  Created by 맨태 on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                homeView
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("", systemImage: "line.3.horizontal", action: {
                                
                            })
                        }
                        
                        ToolbarItem(placement: .principal) {
                            Text("2. 18. (화)")
                                .font(.headline)
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("D-Day", action: {
                                
                            })
                        }
                    }
            }
            .tabItem {
                Label("홈", systemImage: "house.fill")
            }
            
            Text("그룹 화면")
                .tabItem {
                    Label("그룹", systemImage: "person.2")
                }
            
            Text("더보기 화면")
                .tabItem {
                    Label("더보기", systemImage: "ellipsis")
                }
        }
        .tint(.black)
    }
    
    private var homeView: some View {
        VStack {
            Text("00:00:00")
                .font(.system(size: 50, weight: .bold))
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            pagingView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private var pagingView: some View {
        VStack {
            HStack(spacing: 50) {
                VStack {
                    Button("타이머", action: {
                        
                    })
                    Capsule()
                        .frame(width:40, height: 4)
                }
                VStack {
                    Button("교재", action: {
                        
                    })
                    Capsule()
                        .frame(width:40, height: 0)
                }
                VStack {
                    Button("통계", action: {
                        
                    })
                    Capsule()
                        .frame(width:40, height: 0)
                }
                VStack {
                    Button("플래너", action: {
                        
                    })
                    Capsule()
                        .frame(width:40, height: 0)
                }
            }
            .font(.title3)
            
            Divider()
            
            let arrays: [String] = ["운동", "flutter", "firebase", "UIKit", "swiftUI"]
            
            ScrollView {
                ForEach(arrays, id: \.self) { item in
                    HStack {
                        Circle()
                            .fill(.blue)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                            }
                        Text("운동")
                        Spacer()
                        Text("00:00:00")
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
 

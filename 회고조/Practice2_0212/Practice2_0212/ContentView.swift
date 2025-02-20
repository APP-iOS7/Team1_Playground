//
//  ContentView.swift
//  Practice2_0212
//
//  Created by 최하진 on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Tab("알람", systemImage: "alarm.fill") {
                    StopWatchView()
                }
                Tab("세계시각", systemImage: "globe") {
                    StopWatchView()
                }
                Tab("스톱워치", systemImage: "stopwatch.fill") {
                    StopWatchView()
                }
                Tab("타이머", systemImage: "gauge.with.needle") {
                    StopWatchView()
                }
            }
//            .tabViewStyle(.page)
            .toolbar(content: {
                ToolbarItem(content: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                })
            })
        }
    }
}

#Preview {
    ContentView()
}

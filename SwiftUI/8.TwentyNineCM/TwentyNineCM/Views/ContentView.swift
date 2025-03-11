//
//  ContentView.swift
//  TwentyNineCM
//
//  Created by 맨태 on 2/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            VStack {
                NavigationLink(destination: AgreeView(), label: {
                    Text("회원가입")
                })
                .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}

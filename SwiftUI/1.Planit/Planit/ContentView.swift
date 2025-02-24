//
//  ContentView.swift
//  Planit
//
//  Created by 맨태 on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var secondViewIsShowing: Bool = false
    @State private var thirdViewIsShowing: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    withAnimation {
                        secondViewIsShowing = true
                    }
                }, label: {
                    Text("Second View")
                })
            }
            .padding()
            
            if secondViewIsShowing {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        secondViewIsShowing = false
                        
                    }
                
                SecondView(thirdViewIsShowing: $thirdViewIsShowing,
                           dateString: "2월 11일(화)")
                    .frame(width: 300, height: 450)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .shadow(radius: 1)
                    )
            }
            
            if thirdViewIsShowing {
                ThirdView()
                    .onTapGesture {
                        thirdViewIsShowing = false
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

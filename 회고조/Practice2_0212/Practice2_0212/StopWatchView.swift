//
//  StopWatchView.swift
//  Practice2_0212
//
//  Created by 최하진 on 2/12/25.
//

import SwiftUI

struct StopWatchView: View {

    @State private var isStart : Bool = false
    @State private var isStop : Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text("00 : 00 . 00")
                .font(.largeTitle)
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isStop.toggle()
                }, label: {
                    HStack {
                        if isStop {
                            Text("리셋")
                                .font(.headline)
                                .foregroundStyle(Color.gray)
                        } else {
                            Text("구간 기록")
                                .font(.headline)
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .backgroundStyle(Color.clear)
                    .frame(width: 110, height: 38, alignment: .center)
                })
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                Spacer()
                Button(action: {
                    isStart.toggle()
                }, label: {
                    HStack {
                        if isStart {
                            Text("정지")
                                .font(.headline)
                        } else {
                            Text("시작")
                                .font(.headline)
                        }
                    }
                    .frame(width: 110, height: 38, alignment: .center)
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(Color(red: 0.373, green: 0.369, blue: 0.885))
                Spacer()
            }
            .padding(30)
        }
        
    }
}

#Preview {
    StopWatchView()
}

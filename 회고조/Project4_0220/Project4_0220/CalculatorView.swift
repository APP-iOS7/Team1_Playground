//
//  CalculatorView.swift
//  Project4_0220
//
//  Created by 최하진 on 2/20/25.
//

import SwiftUI

struct numset : Hashable {
    var color : Color
    var title : String
    var isText : Bool
    init(_ color: Color, _ title: String, _ isText: Bool) {
        self.color = color
        self.title = title
        self.isText = isText
    }
}
extension Color {
    static let gray2 = Color("numColor")
}
struct CalculatorView: View {
    private var numSet : [numset] = [
        numset(.gray, "AC", true), numset(.gray,  "plus.forwardslash.minus", false),numset(.gray, "percent", false),numset(.orange, "divide", false),
        numset(Color.gray2, "7", true), numset(Color.gray2, "8", true),numset(Color.gray2, "9", true),numset(.orange, "multiply", false),
        numset(Color.gray2, "4", true), numset(Color.gray2, "5", true),numset(Color.gray2, "6", true),numset(.orange, "minus", false),
        numset(Color.gray2, "1", true), numset(Color.gray2, "2", true),numset(Color.gray2, "3", true),numset(.orange, "plus", false),
        numset(Color.gray2, "wallet.pass.fill", false), numset(Color.gray2, "0", true),numset(Color.gray2, ".", true),numset(.orange, "equal", false)
    ]
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())]
    var display = "0"
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "list.bullet")
                        .foregroundStyle(Color.orange)
                        .font(.title)
                        .padding(5)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text(display)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 70))
                }
                VStack{
                    LazyVGrid(columns: columns){
                        ForEach(numSet, id: \.self) { set in
                            buttonView(color: set.color, title: set.title, isText: set.isText)
                        }
                    }
                }
            }
        }
//        .toolbar {
//            menu
//        }
    }
}

struct buttonView: View {
    var color : Color
    var title : String
    var isText : Bool
    var body: some View {
        if isText {
            Circle()
                .fill(color)
                .overlay(
                    Text(title)
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                )
        } else {
            Circle()
                .fill(color)
                .overlay(
                    Image(systemName: title)
                        .font(.largeTitle)
                        .foregroundStyle(Color.white)
                )
        }
    }
}

#Preview {
    CalculatorView()
}

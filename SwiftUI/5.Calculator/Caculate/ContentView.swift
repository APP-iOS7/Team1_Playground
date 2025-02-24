//
//  ContentView.swift
//  Caculate
//
//  Created by 맨태 on 2/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "0"
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(text)
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .padding(.trailing, 10)
                        .padding(.bottom, -15)
                }
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    GridRow {
                        Circle()
                            .fill(.gray)
                            .overlay {
                                Text("AC")
                                    .font(.system(size: 35))
                            }
                            .onTapGesture {
                                text = "0"
                            }
                        Circle()
                            .fill(.gray)
                            .overlay {
                                Image(systemName: "plus.forwardslash.minus")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                        Circle()
                            .fill(.gray)
                            .overlay {
                                Image(systemName: "percent")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                        Circle()
                            .fill(.orange)
                            .overlay {
                                Image(systemName: "divide")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                    }
                    GridRow {
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("7")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "7" }
                                else { text += "7" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("8")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "8" }
                                else { text += "8" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("9")
                                    .font(.system(size: 30))
                                
                            }
                            .onTapGesture {
                                if text == "0" { text = "9" }
                                else { text += "9" }
                            }
                        Circle()
                            .fill(.orange)
                            .overlay {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(32)
                            }
                    }
                    GridRow {
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("4")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "4" }
                                else { text += "4" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("5")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "5" }
                                else { text += "5" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("6")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "6" }
                                else { text += "6" }
                            }
                        Circle()
                            .fill(.orange)
                            .overlay {
                                Image(systemName: "minus")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                    }
                    GridRow {
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("1")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "1" }
                                else { text += "1" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("2")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "2" }
                                else { text += "2" }
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("3")
                                    .font(.system(size: 30))
                            }
                            .onTapGesture {
                                if text == "0" { text = "3" }
                                else { text += "3" }
                            }
                        Circle()
                            .fill(.orange)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                    }
                    GridRow {
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text("0")
                                    .font(.system(size: 30))
                            }
                        Circle()
                            .fill(Color(uiColor: UIColor.darkGray))
                            .overlay {
                                Text(".")
                                    .font(.system(size: 30))
                            }
                        Circle()
                            .fill(.orange)
                            .overlay {
                                Image(systemName: "equal")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(30)
                            }
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "exclamationmark.3")
                            .resizable()
                            .rotationEffect(.degrees(90))
                            .foregroundStyle(.orange)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 30)
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

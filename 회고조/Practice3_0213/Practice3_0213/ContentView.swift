//
//  ContentView.swift
//  Practice3_0213
//
//  Created by 최하진 on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    //    @State private var num = 4;
    @State private var isPresented = false
    @State var isShownFullScreenCover = false
    var color : [Color] = [.blue]
    var body: some View {
        ZStack {
            
            NavigationView {
                TabView {
                    Tab("홈",systemImage: "house.fill") {
                        mainView()
                    }
                    
                    Tab("새로운 음악",systemImage: "square.grid.2x2.fill") {
                        mainView()
                    }
                    Tab("라디오",systemImage: "dot.radiowaves.left.and.right") {
                        mainView()
                    }
                    Tab("보관함",systemImage: "music.note.house.fill") {
                        mainView()
                    }
                    Tab("검색",systemImage: "magnifyingglass") {
                        mainView()
                    }
                }
//                .overlay(alignment: (lhs: ContentView, rhs: ContentView)) {
//                    smallview()
//                        .offset(x: 200, y: 700)
//                }
                .tint(.pink)
            }
                smallview()
                    .position(x: 200, y: 680)
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .popover(isPresented: $isPresented, attachmentAnchor: .rect(.bounds)) {
                        bigview()
                    }
                //                    .presentationDetents([.fraction(100)])
                    .fullScreenCover(isPresented: $isShownFullScreenCover) {
                        bigview()
                    }
//                    .padding(.bottom )
            
        }
    }

    struct smallview: View {
        var body: some View {
            HStack{
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 43 ,height: 43)
        
                Text("Dash")
                Spacer()
                Image(systemName: "play.fill")
                    .font(.title2)
                    .padding([.trailing], 10)
                Image(systemName: "forward.fill")
                    .font(.title2)
            }
            .frame(width: 350, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white.opacity(0.96))
                    .frame(width: 370, height: 60)
            )
            .shadow(radius: 10)
        }
    }
    
    struct bigview: View {
        var body: some View {
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 43 ,height: 43)
            
                    Text("Dash")
                    Spacer()
               
                }

                Spacer()
                HStack{}
            }
        }
    }
    
    struct mainView: View {
        @State private var title = ""
        var body: some View {
            NavigationStack {
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach((0...10), id: \.self) {_ in
                                squareView()
                            }
                        }
                    }
                    .padding([.leading, .trailing],10)
                }
                .navigationTitle(
                    Text("검색")
                        .font(.largeTitle))
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 30, height: 30)
                            .shadow(radius: 5)
                    }
                }
                .toolbarTitleDisplayMode(.automatic)
                .searchable(text: $title, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("아티스트, 노래, 가사 등"))
                
            }
        }
    }
    
    struct squareView: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .overlay(
                    HStack(alignment: .bottom){
                        Text("댄스")
                    }
                )
                
        }
    }
}

#Preview {
    ContentView()
}

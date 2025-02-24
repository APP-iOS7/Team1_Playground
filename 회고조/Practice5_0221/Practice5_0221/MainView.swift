//
//  MainView.swift
//  Practice5_0221
//
//  Created by 최하진 on 2/21/25.
//

import SwiftUI

extension Color {
    static let color1 = Color(red: 0.983, green: 0.106, blue: 0.365)
}

private var day = ["일","월","화","수","목","금","토"]
struct Item: Hashable {
    var title: String
    var amPm: String
    var hour: Int
    var min: Int
    var days: [String]
    var isOn: Bool = true
    
    init(title: String, amPm: String, hour: Int, min: Int, days: [String],_ isOn: Bool) {
        self.isOn = isOn
        self.title = title
        self.amPm = amPm
        self.hour = hour
        self.min = min
        self.days = days
    }
}
struct MainView: View {
    private let commonGradient = LinearGradient(colors: [.color1, .yellow], startPoint: .leading, endPoint: .trailing)
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black.ignoresSafeArea(.all)
                TabView {
                    Tab("알람", systemImage: "alarm.fill") {
                        AlarmView()
                            .backgroundStyle(Color.black)
                    }
                    Tab("수면", systemImage: "moon.stars") {
                        Text("수면")
                    }
                    Tab("아침", systemImage: "sun.max") {
                        Text("아침")
                    }
                    Tab("리포트", systemImage: "doc.plaintext") {
                        Text("리포트")
                    }
                    Tab("설정", systemImage: "gearshape") {
                        Text("설정")
                    }
                }
                .onAppear {
                    UITabBar.appearance().backgroundColor = .black
                    UITabBar.appearance().barTintColor = .black
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color.white)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(commonGradient)
                        .frame(width: 90, height: 25)
                        .overlay(
                            Text("👑 프리미엄")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                        )
                }
            }
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(.black, for: .automatic)
        }
    }
}

struct stackView: View {
    @State var item: Item
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    ForEach(day, id: \.self){day in
                        Text(day)
                            .font(.caption)
                            .foregroundStyle(!item.isOn ? Color.gray : item.days.contains(day) ? Color.blue : Color.blue.opacity(0.4))
                    }
                }
                HStack{
                    Text(item.amPm)
                        .font(.title)
                        .foregroundStyle(item.isOn ? Color.white : Color.gray)
                        .fontWeight(.bold)
                    Text("\(item.hour):\(item.min)")
                        .font(.largeTitle)
                        .foregroundStyle(item.isOn ? Color.white : Color.gray)
                        .fontWeight(.bold)
                }
                .backgroundStyle(Color.clear)
                Text(item.title)
                    .font(.caption)
                    .foregroundStyle(item.isOn ? Color.white : Color.gray)
            }
            .backgroundStyle(Color.clear)
            .padding(20)
            Spacer()
            VStack(alignment: .listRowSeparatorTrailing) {
                Toggle("onOff", isOn: $item.isOn)
                    .labelsHidden()
                    .toggleStyle(.switch)
                    .tint(item.isOn ? Color.blue : Color.gray)
                    .padding(.bottom, 20)
                
                Menu {
                    Button("Cancel", action: {})
                    Button("Search", action: {})
                    Button("Add", action: {})
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundStyle(item.isOn ? Color.white : Color.gray)
                }
            }
            .backgroundStyle(Color.clear)
            .padding()
        }
        .frame(width: 360, height: 130)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.104, green: 0.117, blue: 0.156))
        )
    }
}

#Preview {
    MainView()
}

struct AlarmView: View {
    @State var items : [Item] = [
        Item(title: "미션", amPm: "오전", hour: 8, min: 58, days: ["월","화","수","목","금"], true),
        Item(title: "미션", amPm: "오전", hour: 8, min: 45, days: ["월","화","수","목","금"], false),
        Item(title: "미션", amPm: "오전", hour: 8, min: 57, days: ["월","화","수","목","금"], false),
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gray)
                            .frame(width: 90, height: 25)
                            .overlay(
                                Text("다음 알람 ❯")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                            )
                            .padding(.top, 40)
                        Text("2일 후에 울려요")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                        Spacer()
                        Grid(alignment: .center) {
                            ForEach(items, id: \.self) {item in
                                stackView(item: item)
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Circle()
                            .fill(.red)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text("+")
                                    .font(.largeTitle)
                                    .foregroundStyle(Color.white)
                            )
                            .padding(.bottom, 50)
                            .padding(.trailing, 15)
                    }
                }
            }
        }
    }
}

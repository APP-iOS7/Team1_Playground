//
//  MainView.swift
//  Practice6_0226
//
//  Created by 최하진 on 2/26/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.pink.opacity(0.06).ignoresSafeArea(.all)
            VStack {
                TopLineView()
                SecondLineView()
                DairyItemsView()
                Spacer()
            }
            AddDiaryButtonView()
        }
    }
}

#Preview {
    MainView()
}







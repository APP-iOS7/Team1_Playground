//
//  ContentView.swift
//  Practice7_0228
//
//  Created by 최하진 on 2/28/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [User]
    
    @ObservedObject var viewModel: UserViewModel = UserViewModel(user: User())
    var body: some View {
        NavigationStack {
            NavigationLink("가입하기") {
                AgreementView(viewModel: viewModel)

            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}

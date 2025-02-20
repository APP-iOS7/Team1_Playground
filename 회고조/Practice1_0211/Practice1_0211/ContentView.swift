//
//  ContentView.swift
//  Practice1_0211
//
//  Created by 최하진 on 2/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
//    @State var
    @State var isShowing = false
    var body: some View {
        ZStack{
            NavigationStack {
                if isShowing {
                    DailyView()
                        .frame(width: 300, height: 450)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
//                                .frame(width: 300, height: 450)
                                .shadow(radius: 10)
                        )
                        .onTapGesture {
                            isShowing.toggle()
                        }
                }
                else {
                    Button(action: { isShowing.toggle() }) {
                        Label("TODAY", systemImage: "square.and.pencil")
                    }
                }
            }
//            .sheet(isPresented: $isShowing, content:{
//                
//            } )
            
        }
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

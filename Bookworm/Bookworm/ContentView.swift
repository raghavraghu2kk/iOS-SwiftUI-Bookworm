//
//  ContentView.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView{
                MainContent()
                    .tabItem { Label("Bookworm", systemImage: "text.book.closed.fill") }
                
                List{
                    NavigationLink {
                        lesson1()
                    } label: {
                        Text("Lesson1 - Custom compo with binding")
                    }
                    
                    NavigationLink {
                        lesson2_multilineTextInput()
                    } label: {
                        Text("Lesson 2 - Multiline Text Input")
                    }
                    
                    NavigationLink {
                        lesson3___Introduction_To_Swift_Data()
                    } label: {
                        Text("Lesson 3 - Introduction To Swift Data")
                    }
                }.tabItem { Label("Lessons", systemImage: "pencil.and.list.clipboard") }
            }
        }
    }
}

#Preview {
    ContentView()
}

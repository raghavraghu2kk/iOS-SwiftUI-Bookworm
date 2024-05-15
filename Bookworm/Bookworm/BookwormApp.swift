//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Book.self,Student3.self])
    }
}

//
//  MainContent.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct MainContent: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Book.rating, order: .reverse) var books : [Book]

//    @Query(sort: [SortDescription(\Book.title, order: .reverse)]) var books : [Book]
    
//    @Query(sort: [
//        SortDescription(\Book.title),
//        SortDescription(\Book.author)
//    ]) var books : [Book]
    
    @State private var showingAddScreen = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, content: {
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            })
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    deleteBooks(at: indexSet)
                })
            }
            .navigationBarTitle("Bookworm")
            .navigationDestination(for: Book.self, destination: { book in
                DetailView(book: book)
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: {
                AddBookView()
            })
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    MainContent()
}

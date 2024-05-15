//
//  DetailView.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book : Book
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing, content: {
                Image(book.genere)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genere.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            })
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("delete this book",systemImage: "trash"){
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test book", author: "Myself", genere: "Fantasy", review: "This was a great moview", rating: 4)
        return DetailView(book: example)
                    .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

//
//  AddBookView.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy","Horror","Kids","Mystery","Poetry","Romance","Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                }
                
                Section{
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                }
                
                Section("Rating") {
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button {
                        let newBook = Book(title: title, author: author, genere: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

#Preview {
    AddBookView()
}

//
//  Book.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title : String
    var author : String
    var genere : String
    var review : String
    var rating : Int
    
    init(title: String, author: String, genere: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genere = genere
        self.review = review
        self.rating = rating
    }
}

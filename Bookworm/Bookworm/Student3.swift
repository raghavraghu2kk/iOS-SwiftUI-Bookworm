//
//  Student3.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import Foundation
import SwiftData

@Model
class Student3 {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

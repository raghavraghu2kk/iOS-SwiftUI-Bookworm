//
//  lesson3 - Introduction To Swift Data.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftData
import SwiftUI

struct lesson3___Introduction_To_Swift_Data: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student3]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button {
                    let firstNames = ["Raghav","Rahul","Rajat","Sanath","Rahul","Rajath"]
                    let lastNames = ["Raghu","Jugati","Jingade","Sunny","Pammar","PR"]
                    
                    let choosenFirstName = firstNames.randomElement()!
                    let choosenLastName = lastNames.randomElement()!
                    
                    // more code to come
                    let student = Student3(id: UUID(), name: "\(choosenFirstName) \(choosenLastName)")
                    modelContext.insert(student)
                } label: {
                    Text("Add")
                }

            }
        }
    }
}

#Preview {
    lesson3___Introduction_To_Swift_Data()
}

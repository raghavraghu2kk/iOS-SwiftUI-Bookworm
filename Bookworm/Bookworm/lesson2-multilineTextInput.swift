//
//  lesson2-multilineTextInput.swift
//  Bookworm
//
//  Created by Raghavendra Mirajkar on 15/05/24.
//

import SwiftUI

struct lesson2_multilineTextInput: View {
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    lesson2_multilineTextInput()
}

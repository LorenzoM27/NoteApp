//
//  searchBar.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
            
            TextField("Rechercher", text: $searchText)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(Color.primary.opacity(0.06), in: .rect(cornerRadius: 10))
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}

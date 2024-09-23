//
//  Note.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct Note: Identifiable {
    
    var id = UUID().uuidString
    var color: Color
    
    /// View properties
    var allowsHitTesting: Bool = false
    
}


var mockNotes: [Note] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .purple)
]

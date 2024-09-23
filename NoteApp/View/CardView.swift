//
//  cardView.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct CardView: View {
    
    @Binding var selectedNote: Note?
    @Binding var animateView: Bool
    
    var note: Note
    
    var body: some View {
        ZStack {
            if selectedNote?.id  == note.id && animateView {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.clear)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(note.color.gradient)
            }
            
        }
            
    }
}

#Preview {
    CardView(selectedNote: .constant(Note(color: .red)), animateView: .constant(true), note: Note(color: .red) )
}

//
//  BottomBar.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct BottomBar: View {
    
    @Binding var notes : [Note]
    @Binding var selectedNote : Note?
    @Binding var animateView: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            
            Button {
                
            } label: {
                Image(systemName: selectedNote == nil ? "plus.circle.fill" : "trash.fill")
                    .font(.title2)
                    .foregroundStyle(selectedNote == nil ? Color.primary : .red)
                    .contentShape(.rect)
                    .contentTransition(.symbolEffect(.replace))
            }
            Spacer(minLength: 0)
            
            if selectedNote != nil {
                Button {
                    
                    if let firstIndex = notes.firstIndex(where: { $0.id == selectedNote?.id }) {
                        notes[firstIndex].allowsHitTesting = false
                    }
                    withAnimation(noteAnimation) {
                        animateView = false
                        selectedNote = nil
                    }
                } label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .font(.title3)
                        .foregroundStyle(Color.primary)
                        .contentShape(.rect)
                }
                .transition(.opacity)
            }
            
        }
        .overlay {
            Text("Notes")
                .font(.callout)
                .fontWeight(.semibold)
                .opacity(selectedNote != nil ? 0 :1 )
        }
        .overlay {
            if selectedNote != nil {
                CardColorPicker()
                    .transition(.blurReplace)
            }
        }
        .padding(15)
        .background(.bar)
        .animation(noteAnimation, value: selectedNote != nil) // anime seulement quand différent de nil
    }
}

#Preview {
    BottomBar(notes: .constant([Note(color: .red)]), selectedNote: .constant(Note(color: .red)), animateView: .constant(true))
}

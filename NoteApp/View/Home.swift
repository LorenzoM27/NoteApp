//
//  Home.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct Home: View {
    
    @State private var searchText: String = ""
    @State private var selectedNote: Note?
    @State private var animateView: Bool = false
    @Namespace private var animation
    @State private var notes : [Note] = mockNotes
    
    var body: some View {
        
        VStack(spacing: 20) {
            SearchBar(searchText: $searchText)
            ScrollView(.vertical) {
                
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach($notes) { $note in
                        CardView(selectedNote: $selectedNote, animateView: $animateView, note: note)
                            .frame(height: 160)
                            .onTapGesture {
                                guard selectedNote == nil else { return } // permet d'ouvrir une seule dtail view à la fois
                                selectedNote = note
                                
                                note.allowsHitTesting = true
                                
                                withAnimation(noteAnimation) {
                                    animateView = true
                                }
                            }
                    }
                }
            }
        }
        .safeAreaPadding(15)
        .overlay {
            GeometryReader { _ in
                ForEach(notes) { note in
                    if note.id == selectedNote?.id && animateView {
                        DetailView(animation: animation, note: note)
                            .ignoresSafeArea(.container, edges: .top)
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar(notes: $notes, selectedNote: $selectedNote, animateView: $animateView)
        }
    }
    
}

// In a extension because we want to use this animation for the entire app animation and transitions
extension View {
    var noteAnimation: Animation {
        .smooth(duration: 0.3, extraBounce: 0)
    }
    
}

#Preview {
    Home()
}

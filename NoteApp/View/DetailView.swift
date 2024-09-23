//
//  DetailView.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct DetailView: View {
    
    var animation: Namespace.ID
    var note: Note
    /// View Properties
    @State private var animateLayers: Bool = false
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: animateLayers ? 0 : 10)
            .fill(note.color.gradient)
            .matchedGeometryEffect(id: note.id, in: animation)
            //.transition(.offset(y: 1))
            .allowsHitTesting(note.allowsHitTesting) // par defaut les animations sont desativées. Activé au tap et désactivées à la fermeture
            .onChange(of: note.allowsHitTesting, initial: true) { oldValue, newValue in
                animateLayers = newValue
            }
    }
}

//#Preview {
//    DetailView(animation: <#Namespace.ID#>, note: <#Note#>)
//}

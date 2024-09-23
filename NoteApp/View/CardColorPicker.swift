//
//  CardColorPicker.swift
//  NoteApp
//
//  Created by Lorenzo Menino on 23/09/2024.
//

import SwiftUI

struct CardColorPicker: View {
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(1...5, id: \.self) { index in
                Circle()
                    .fill(.red.gradient)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    CardColorPicker()
}

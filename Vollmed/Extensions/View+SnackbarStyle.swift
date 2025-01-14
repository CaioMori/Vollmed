//
//  View+SnackbarStyle.swift
//  Vollmed
//
//  Created by Caio Mori on 14/01/25.
//

import SwiftUI

extension View {
    func snackbarStyle(backgroundColor: Color) -> some View {
        self
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}


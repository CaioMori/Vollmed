//
//  VollmedApp.swift
//  Vollmed
//
//  Created by Caio Mori on 02/01/25.
//

import SwiftUI

@main
struct VollmedApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView()
                SignUpView()
            }
        }
    }
}

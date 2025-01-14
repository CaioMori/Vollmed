//
//  SnackbarErrorView.swift
//  Vollmed
//
//  Created by Caio Mori on 14/01/25.
//

import SwiftUI

struct SnackbarErrorView: View {
    
    @Binding var isShowing: Bool
    var message: String?
    var backgroundColor: Color = SnackbarConstants.defaultBackgroundColor
    
    var body: some View {
        VStack {
            Spacer()
            
            if isShowing {
                Text(message ?? SnackbarConstants.defaultMessage)
                    .snackbarStyle(backgroundColor: backgroundColor)
                    .accessibilityLabel("Mensagem de erro")
                    .accessibilityHint(message ?? "Erro desconhecido.")
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .onAppear(perform: autoDismiss)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, isShowing ? SafeAreaInsetsHelper.safeAreaBottomInset() : -100)
    }
    
    private func autoDismiss() {
        DispatchQueue.main.asyncAfter(deadline: .now() + SnackbarConstants.dismissDelay) {
            withAnimation(.easeInOut) {
                isShowing = false
            }
        }
    }
}

#Preview {
    SnackbarErrorView(
        isShowing: .constant(true),
        message: "Ops! Ocorreu um erro, mas já estamos trabalhando para solucionar."
    )
}

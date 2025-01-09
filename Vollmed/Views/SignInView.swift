//
//  SignInView.swift
//  Vollmed
//
//  Created by Caio Mori on 06/01/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToSignIn: Bool = false
    @State private var isLoading: Bool = false
    
    let webService = WebService()
    
    func login() async {
        isLoading = true
        do {
            if let response = try await webService.loginPatient(
                loginRequest: LoginRequest(email: email, password: password)) {
                UserDefaultsHelper.save(value: response.token, key: "token")
                UserDefaultsHelper.save(value: response.id, key: "patient-id")
                navigateToSignIn = true
            } else {
                showAlert = true
            }
        } catch {
            showAlert = true
            print("Ocorreu um erro no login! \(error)")
        }
        isLoading = false
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                
                Text("Olá")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.accent)
                
                Text("Preencha para acessar sua conta.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                
                Text("Email")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu email", text: $email)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                Text("Senha")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                SecureField("Digite sua senha", text: $password)
                    .padding(14)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                    .padding(.bottom)
                
                Button {
                    Task {
                        await login()
                    }
                } label: {
                    ButtonView(text: "Entrar")
                }
                .disabled(isLoading)
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Ainda não possui uma conta? Cadastre-se")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
            .navigationBarBackButtonHidden()
            .alert(
                "Ops, algo deu errado!",
                isPresented: $showAlert) {
                    Button {
                        //
                    } label: {
                        Text("Ok")
                    }
                } message: {
                    Text("Houve um erro ao entrar na sua conta! Tente novamente")
                }
                .navigationDestination(
                    isPresented: $navigateToSignIn) {
                        HomeView()
                    }
                .disabled(isLoading)
            
            if isLoading {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                ProgressView("Carregando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

//
//  SignUpView.swift
//  Vollmed
//
//  Created by Caio Mori on 06/01/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var nameField: String = ""
    @State private var cpfField: String = ""
    @State private var emailField: String = ""
    @State private var phoneField: String = ""
    @State private var healthPlanField: String
    @State private var passwordField: String = ""
    
    let healthPlans: [String] = [
        "Amil", "Unimed", "Bradesco Saúde", "SulAmérica", "Hapvida", "Notredame Intermédica", "São Francisco Saúde", "Golden Cross", "Medial Saúde", "Outro", "América Saúde"
    ]
    
    init(){
        self.healthPlanField = healthPlans.first!
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                    .padding(.vertical)
                
                Text("Olá, boas-vindas!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.accent)
                
                Text("Insira seus dados para criar uma conta.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                
                Text("Nome")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu nome completo", text: $nameField)
                    .padding(14.0)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(16.0)
                    .autocorrectionDisabled()
                
                Text("Email")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu email", text: $emailField)
                    .padding(14.0)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(16.0)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                Text("CPF")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu cpf", text: $cpfField)
                    .padding(14.0)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(16.0)
                    .keyboardType(.numberPad)
                    .autocorrectionDisabled()
                
                Text("Telefone")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu número telefone", text: $phoneField)
                    .padding(14.0)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(16.0)
                    .keyboardType(.numberPad)
                    .autocorrectionDisabled()
                
                Text("Selecione o seu plano de saúde")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                Picker("Plano de saúde", selection: $healthPlanField) {
                    ForEach(healthPlans, id: \.self) { healthPlan in
                        Text(healthPlan)
                    }
                }
                
                Text("Senha")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                SecureField("Insira sua senha", text: $passwordField)
                    .padding(14.0)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(16.0)
                
                Button {
                    print(healthPlanField)
                } label: {
                    ButtonView(text: "Criar conta")
                }
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Já possui conta?")
                        .bold()
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity, alignment: .center)
                }


            }
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}

#Preview {
    SignUpView()
}

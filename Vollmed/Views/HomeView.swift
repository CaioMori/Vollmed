//
//  HomeView.swift
//  Vollmed
//
//  Created by Caio Mori on 02/01/25.
//

import SwiftUI

struct HomeView: View {
    
    let service = WebService()
    
    @State private var specialists: [Specialist] = []
    
    func getSpecialists() async {
        do {
            if let specialists = try await service.getAllSpecialists() {
                self.specialists = specialists
            }
        } catch {
            print("Ocorreu um erro ao obter os especialistas: \(error)")
        }
    }
    
    func handleLogout() async {
        do {
            let logoutSuccessful = try await service.logoutPatient()
            if logoutSuccessful {
                UserDefaultsHelper.remove(for: "token")
                UserDefaultsHelper.remove(for: "patient-id")
            }
        } catch {
            print("Ocorreu um erro no logout \(error)")
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.vertical, 32)
                Text("Boas-vindas!")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(.lightBlue))
                Text("Veja abaixo os especialistas da Vollmed disponíveis e marque já a sua consulta!")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 16)
                ForEach(specialists) { specialist in
                    SpecialistCardView(specialist: specialist)
                        .padding(.bottom, 8)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear {
            Task {
                await getSpecialists()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await handleLogout()
                    }
                    print("logout")
                } label: {
                    HStack {
                        Text("Logout")
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }

            }
        }
    }
}

#Preview {
    HomeView()
}

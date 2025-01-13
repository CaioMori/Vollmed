//
//  HomeView.swift
//  Vollmed
//
//  Created by Caio Mori on 02/01/25.
//

import SwiftUI

struct HomeView: View {

    var viewModel = HomeViewModel()
    
    @State private var specialists: [Specialist] = []
    
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
                do {
                    let response = try await viewModel.getSpecialists()
                    DispatchQueue.main.async {
                        self.specialists = response
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        do {
                            try await viewModel.logout()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
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

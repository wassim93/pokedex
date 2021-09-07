//
//  PokedexView.swift
//  Pokedex
//
//  Created by wassim on 30/8/2021.
//

import SwiftUI

struct PokedexView: View {
    
    private let gridItems :[GridItem] = Array(repeating: .init(.flexible(),spacing:3), count: 2)
    @ObservedObject var pvModel :PokemonViewModel = PokemonViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(pvModel.pokemon) { pokemon in
                            NavigationLink(destination: DetailView(pokemon: pokemon, viewModel: pvModel)) {
                                PokemonCell(pokemon: pokemon, viewModel: pvModel)
                            }
                        }
                    }
                }
                .navigationTitle("Pokemon")
            }.accentColor(.white)
            
            FloatingButtonView()
        }
    }
    
    fileprivate func FloatingButtonView() -> some View{
        return VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    print("click")
                }, label: {
                    Image(systemName: "list.bullet.indent")
                        .frame(width: 67, height: 60)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                })
                .background(Color.purple)
                .cornerRadius(38.5)
                .padding()
                .shadow(color: Color.black.opacity(0.3),radius: 3,x: 3,y: 3)
            }
        }
    }
    
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

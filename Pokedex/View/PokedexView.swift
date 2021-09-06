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
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(pvModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon, viewModel: pvModel)
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

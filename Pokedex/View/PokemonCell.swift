//
//  PokemonCell.swift
//  Pokedex
//
//  Created by wassim on 30/8/2021.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    let pokemon :Pokemon
    let pvModel :PokemonViewModel
    let backgroudColor:Color
    
    
    init(pokemon:Pokemon , viewModel :PokemonViewModel) {
        self.pokemon = pokemon
        self.pvModel =  viewModel
        self.backgroudColor =  Color(pvModel.backgroundColor(forType: pokemon.type))
        
    }
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,4)
                    .padding(.leading,10)
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal,6)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .padding(.leading,5)
                    Spacer()
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 70)
                        .padding([.bottom,.trailing],4)
                }.frame(maxWidth: .infinity)
            }
        }.background(backgroudColor)
        .cornerRadius(12)
        .shadow(color: backgroudColor, radius: 6, x: 0.0, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .padding([.leading,.trailing],8)
    }
}



//
//  PokemonCell.swift
//  Pokedex
//
//  Created by wassim on 30/8/2021.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("Bulbasur")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,4)
                    .padding(.leading)
                HStack{
                    Text("poison")
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
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 70)
                        .padding([.bottom,.trailing],4)
                }.frame(maxWidth: .infinity)
            }
        }.background(Color.green)
        .cornerRadius(12)
        .shadow(color: .green, radius: 6, x: 0.0, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .padding([.leading,.trailing],8)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}

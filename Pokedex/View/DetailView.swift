//
//  DetailView.swift
//  Pokedex
//
//  Created by wassim on 6/9/2021.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let pokemon: Pokemon
    let pvModel :PokemonViewModel
    let backgroudColor:Color
    
    
    init(pokemon:Pokemon , viewModel :PokemonViewModel) {
        self.pokemon = pokemon
        self.pvModel =  viewModel
        self.backgroudColor =  Color(pvModel.backgroundColor(forType: pokemon.type))
        
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                backgroudColor.ignoresSafeArea()
                VStack(alignment: .center,spacing:10){
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width:170,height: 150)
                        .padding(.top,90)
                    
                    VStack(spacing:10){
                        Text(pokemon.name.capitalized)
                            .padding()
                            .font(.largeTitle)
                        
                        Text(pokemon.type)
                            .font(.headline).bold()
                            .foregroundColor(.black)
                            .padding(.horizontal,15)
                            .padding([.top,.bottom],10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(backgroudColor.opacity(0.25))
                            )
                        Text(pokemon.description)
                            .font(.system(size: 18))
                            .padding([.leading,.trailing,.bottom],15)
                        StatView()
                        Spacer()
                    }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(RoundedCorners(tl: 25, tr: 25, bl: 0, br: 0).fill(Color.white))
                    
                }.ignoresSafeArea()
                
            }
        }.ignoresSafeArea()
    }
    
    fileprivate func StatView() -> some View {
        var totalProgress = 100
        if pokemon.weight > 100 {
            totalProgress = 1000
        }
        return VStack{
            HStack{
                Text("Stats")
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.leading)
                Spacer()
            }
            HStack{
                Text("Attack")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .frame(width: 90,alignment: .leading)
                Spacer()
                ProgressView(value:Double(pokemon.attack),total:Double(100))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.red))
                    .padding()
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .overlay(
                        Text(String(pokemon.attack))
                    )
                
            }
            HStack{
                Text("Defense")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .frame(width: 90,alignment: .leading)
                
                Spacer()
                ProgressView(value:Double(pokemon.defense),total:Double(100)) .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .padding()
                    .overlay(
                        Text(String(pokemon.defense))
                    )
            }
            HStack{
                Text("Weight")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .frame(width: 90,alignment: .leading)
                
                
                Spacer()
                
                ProgressView(value:Double(pokemon.weight),total:Double(totalProgress))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.purple))
                    .padding()
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .overlay(
                        Text(String(pokemon.weight))
                    )
                
            }
            HStack{
                Text("Height")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .frame(width: 90,alignment: .leading)
                
                Spacer()
                ProgressView(value:Double(pokemon.height),total:Double(100)).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .padding()
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .overlay(
                        Text(String(pokemon.height))
                    )
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: Pokemon(id: 0, name: "Bulbasur", imageUrl: "1", type: "poison",description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",attack: 10,defense: 20,weight: 50,height: 30), viewModel: PokemonViewModel())
    }
}


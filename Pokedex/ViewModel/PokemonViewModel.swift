//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by wassim on 6/9/2021.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    
    func backgroundColor(forType type:String) -> UIColor {
        switch type {
            case "fire": return .systemRed
            case "water": return .systemBlue
            case "poison": return .systemGreen
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemOrange
            case "ground": return .systemGray
            case "flying": return .systemTeal
            case "fairy": return .systemPink
            default:return .systemIndigo
        }
    }
}


// json response always contain null, string on the begining
// so this function is to cleanup our json response from that null,

/*
 null,
 {
 attack: 49,
 defense: 49,
 description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
 evolutionChain: [
 {
 id: "2",
 name: "ivysaur"
 },
 */
extension Data{
    func parseData(removeString string:String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString =  dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        return data
    }
}

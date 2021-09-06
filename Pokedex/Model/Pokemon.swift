    //
    //  Pokemon.swift
    //  Pokedex
    //
    //  Created by wassim on 5/9/2021.
    //
    
    import Foundation
    
    
    struct Pokemon: Codable,Identifiable {
        let id:Int
        let name,imageUrl,type,description:String
        let attack,defense,weight,height:Int
        
    
    }
    
    
    /*let Mock_Pokemon:[Pokemon] = [
        .init(id: 0, name: "Bulbasur", imageUrl: "1", type: "poison"),
        .init(id: 1, name: "Venusaur", imageUrl: "1", type: "poison"),
        .init(id: 2, name: "Ivysur", imageUrl: "1", type: "poison"),
        .init(id: 3, name: "charmander", imageUrl: "1", type: "fire"),
        .init(id: 4, name: "charmelon", imageUrl: "1", type: "fire"),
        .init(id: 5, name: "charizard", imageUrl: "1", type: "fire"),
        .init(id: 6, name: "squirtle", imageUrl: "1", type: "water"),
        .init(id: 7, name: "wartortle", imageUrl: "1", type: "water"),
        .init(id: 8, name: "blastoise", imageUrl: "1", type: "water"),
    ]*/
    
    
    
    

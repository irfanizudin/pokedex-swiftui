//
//  Pokemon.swift
//  pokedex
//
//  Created by Irfan Izudin on 09/10/22.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Equatable, Hashable {
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable, Identifiable {
    let id: Int
    let height: Int
    let weight: Int
}

//
//  ContentView.swift
//  pokedex
//
//  Created by Irfan Izudin on 29/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pokemonVM = PokemonViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach(pokemonVM.filteredPokemon, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: pokemonVM.filteredPokemon.count)
                .navigationTitle("Pokedex")
            }
            .searchable(text: $pokemonVM.searchText)
        }
        .environmentObject(pokemonVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

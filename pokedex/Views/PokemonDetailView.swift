//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Irfan Izudin on 09/10/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var pokemonVM: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("ID : \(pokemonVM.pokemonDetails?.id ?? 0)")
                Text("Weight : \(pokemonVM.formatHW(value: pokemonVM.pokemonDetails?.weight ?? 0)) KG")
                Text("Height : \(pokemonVM.formatHW(value: pokemonVM.pokemonDetails?.height ?? 0)) M")

            }
        }
        .onAppear() {
            pokemonVM.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}

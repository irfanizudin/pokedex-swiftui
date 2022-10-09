//
//  PokemonView.swift
//  pokedex
//
//  Created by Irfan Izudin on 09/10/22.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var pokemonVM: PokemonViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonVM.getPokemonIndex(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.body)
                .foregroundColor(.primary)
                .padding(.bottom, 20)

        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}

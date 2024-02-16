//
//  PokemonViewModel.swift
//  pokedexInSwiftUI
//
//  Created by Ben Duffield-Harding on 15/02/2024.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    
    @Published var pokemonName: String?
    @Published var pokemonHeight: Int?
    @Published var pokemonWeight: Int?
    @Published var pokemonType: [String]?
    @Published var pokemonAbility: [String]?
    @Published var pokemonImage : String?
    
    func fetchPokemon(by name: String?) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name!.lowercased())")!
        
        // guard let for dealing with optionals - data, response, error
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                // use decoder on Codable protocol struct
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                // assigned to main thread
                DispatchQueue.main.async {
                    self.pokemonName = pokemon.name
                    self.pokemonHeight = pokemon.height
                    self.pokemonWeight = pokemon.weight
                    self.pokemonType = pokemon.types.map { $0.type.name }
                    self.pokemonAbility = pokemon.abilities.map { $0.ability.name }
                    self.pokemonImage = pokemon.sprites.front_default
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

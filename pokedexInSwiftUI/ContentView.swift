//
//  ContentView.swift
//  pokedexInSwiftUI
//
//  Created by Ben Duffield-Harding on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var search: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Section{
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.red)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 4)
                        )
                    Circle()
                        .trim(from: 0.5, to: 0)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
                VStack {
                    Text("Welcome to the Pokedex")
                        .font(.largeTitle)
                        .padding(10)
                    HStack {
                        Section(header: Text("Search a Pokemon:")) {
                            TextField("Enter Pokemon name", text: $search, onEditingChanged: { _ in
                                self.search = self.search.lowercased()
                            })
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .onSubmit {
                                guard !search.isEmpty else { return }
                                viewModel.fetchPokemon(by: search)
                                
                            }
                        }.padding()
                    }
                    
                    
                    if let pokemonName = viewModel.pokemonName {
                        if let pokemonHeight = viewModel.pokemonHeight {
                            if let pokemonWeight = viewModel.pokemonWeight {
                                if let pokemonImage = viewModel.pokemonImage {
                                    AsyncImage(url: URL(string: pokemonImage))
                                    Text(pokemonName)
                                        .font(Font.title3.weight(.bold))
                                        .padding(1)
                                    Text("Height: \(pokemonHeight)")
                                        .font(Font.body.weight(.medium))
                                    Text("Weight: \(pokemonWeight)")
                                        .font(Font.body.weight(.medium))
                                }
                            }
                        }
                        Text("Types:")
                            .font(Font.body.weight(.medium))
                        HStack {
                            ForEach(viewModel.pokemonType ?? [], id: \.self) { type in
                                Text(type)
                                    .padding(1)
                                    .font(Font.body.weight(.medium))
                            }
                        }
                        Text("Abilities:")
                            .font(Font.body.weight(.medium))
                        HStack {
                            ForEach(viewModel.pokemonAbility ?? [], id: \.self) { ability in
                                Text(ability)
                                    .padding(1)
                                    .font(Font.body.weight(.medium))
                            }
                        }
                    }else {
                        Text("Loading...")
                    }
                }
                .onAppear {
                    viewModel.fetchPokemon(by: "pikachu")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

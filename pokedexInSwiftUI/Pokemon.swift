//
//  Pokemon.swift
//  pokedexInSwiftUI
//
//  Created by Ben Duffield-Harding on 15/02/2024.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let height: Int
    let weight: Int
    let types: [TypeEntry]
    let abilities: [AbilityEntry]
    let sprites: Sprites
    
    struct TypeEntry: Codable {
            let type: TypeName
            struct TypeName: Codable {
                let name: String
            }
        }
    
    struct AbilityEntry: Codable {
        let ability: AbilityName
        struct AbilityName: Codable {
            let name: String
        }
    }
    
    struct Sprites: Codable {
        let front_default: String
    }
}

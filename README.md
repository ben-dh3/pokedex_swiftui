# Pokedex SwiftUI Application

Created alongside my writing of this [article](https://medium.com/@benjaminduffield1997/fetch-and-display-data-in-swiftui-6f754163b0ad) explaining how to fetch data from an API. Type the name of the Pokemon you want to find in the search bar and press enter, the fetchPokemon function in PokemonViewModel fetches the data from the [PokeAPI](https://pokeapi.co/), and is translated using the JSONDecoder and the codable struct in Pokemon. The data is formatted and displayed in ContentView with a Poke ball design made using SwiftUI's built in shapes.

Currently displays data including: image, name, height, weight, type, abilities. 

In the future I intend to add a description of the abilities and the stats data.

# Examples

![example1](https://github.com/ben-dh3/pokedex_swiftui/blob/main/images/example1.png?raw=true)

![example2](https://github.com/ben-dh3/pokedex_swiftui/blob/main/images/example2.png?raw=true)

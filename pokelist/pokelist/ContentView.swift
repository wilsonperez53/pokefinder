//
//  ContentView.swift
//  pokelist
//
//  Created by Estudiantes on 3/6/21.
//  Copyright © 2021 wilson. All rights reserved.
//

import SwiftUI

struct Pokemon: Identifiable, Codable{
    let id = UUID()
    let name: String
    let bannerUrl: String
    let power: String
}

extension Image{
    func data(url: URL) -> Self{
        if let data = try? Data(contentsOf: url){
            guard let image = UIImage(data: data) else {
                return Image(systemName: "square.fill")
            }
            return Image(uiImage: image)
            .resizable()
        }
        return self.resizable()
    }
}

q\class PokemonViewModel: ObservedObject<Pokemon>{
    @Published var message = "Message inside the observable object"
    @Published var pokemon: [Pokemon] = [
    .init(
        
        )
    ]
    
    func changeMessage(){
        self.message = "New Messsae"
    }
    
    func fetchPokemons(){
        guard let url = URL(string: "https://api.letsbuildthatapp.com/static/courses.json") else {
            print("invalid url")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([Pokemon].self, from: data){
                    DispatchQueue.main.async {
                        {
                            self.pokemon = response
                        }
                    }
                }
            }
        }
    }
}
struct ContentView: View {
    
    @ObservedObject var pokemonVM = PokemonViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(self.pokemonVM.pokemons){ pokemon in
                    VStack{
                        HStack{
                            Text("Pokemon Name")
                            Text(pokemon.name)
                            
                        }
                        if let bannerURL = URL(string:pokemon.bannerURL){
                            Image(systemName: "heart.fill").data(url: bannerURL)
                                .frame(width: 200.0, height: 100.0)
                        }
                    }
                    
                }
            }.navigationBarTitle("Homework 5")
            .navigationBarItems(
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

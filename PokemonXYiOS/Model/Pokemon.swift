
import Foundation
import Alamofire
import AlamofireImage
import UIKit

struct Pokemon: Decodable{
    let name: String
    let id: String
    let xdescription: String
    let ydescription: String
    let height: String
    let category: String
    let weight: String
    let typeofpokemon: [String]
    let weaknesses: [String]
    let evolutions: [String]
    let abilities: [String]
    let hp: Int
    let attack: Int
    let defense: Int
    let special_attack: Int
    let special_defense: Int
    let speed: Int
    let total: Int
    let male_percentage: String
    let female_percentage: String
    let genderless: Int
    let cycles: String
    let egg_groups: String
    let evolvedfrom: String
    let reason:String
    let base_exp: String
    
    var pokemon_imagesrc: String = ""
    var pokemon_gifsrc: String = ""
    
    
    
    init(pkmn: NSDictionary)
    {
      self.name = pkmn["name"] as! String
        self.id = pkmn["id"] as! String
        self.xdescription = pkmn["xdescription"] as! String
        self.ydescription = pkmn["ydescription"] as! String
        self.height = pkmn["height"] as! String
        self.category = pkmn["category"] as! String
        self.weight = pkmn["weight"] as! String
        self.typeofpokemon = pkmn["typeofpokemon"] as! [String]
        self.weaknesses = pkmn["weaknesses"] as! [String]
        self.evolutions = pkmn["evolutions"] as! [String]
        self.abilities = pkmn["abilities"] as! [String]
        self.hp = pkmn["hp"] as! Int
        self.attack = pkmn["attack"] as! Int
        self.defense = pkmn["defense"] as! Int
        self.special_attack = pkmn["special_attack"] as! Int
        self.special_defense = pkmn["special_defense"] as! Int
        self.speed = pkmn["speed"] as! Int
        self.total = pkmn["total"] as! Int
        self.genderless = pkmn["genderless"] as! Int
        
        
        self.cycles = pkmn["cycles"] as! String
        self.egg_groups = pkmn["egg_groups"] as! String
        self.evolvedfrom = pkmn["evolvedfrom"] as! String
        self.reason = pkmn["reason"] as! String
        self.base_exp = pkmn["base_exp"] as! String
        
        if self.genderless != 0
        {
            self.male_percentage = ""
            self.female_percentage = ""
        }
        
        else
        {
            self.male_percentage = pkmn["male_percentage"] as! String
            self.female_percentage = pkmn["female_percentage"] as! String
        }
    }
    
    
    
    
    mutating func getPokemonContent(){
        let pokeNumbr = gettingPokemonNumber(idNumbr: self.id)
        
        if pokeNumbr <= 807
        {
            self.pokemon_imagesrc = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/" + "\(pokeNumbr)" + ".png"
        }
        
        else
        {
            if pokeNumbr == 808
            {
                self.pokemon_imagesrc = "https://img.pokemondb.net/sprites/home/normal/meltan.png"
            }
                
            else
            {
                self.pokemon_imagesrc = "https://img.pokemondb.net/sprites/home/normal/melmetal.png"
            }
                
        }
        
        
        var nameLowercase = self.name.lowercased()
        nameLowercase = nameLowercase.replacingOccurrences(of: " ", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: "'", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: "♀", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: "♂", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: "-", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: "é", with: "e")
        nameLowercase = nameLowercase.replacingOccurrences(of: ".", with: "")
        nameLowercase = nameLowercase.replacingOccurrences(of: ":", with: "")
        
        self.pokemon_gifsrc = "https://play.pokemonshowdown.com/sprites/xyani/" + "\(nameLowercase)" + ".gif"
        
    }
    
    
    
    func gettingPokemonNumber(idNumbr: String) -> Int {
        let midNmbr =     idNumbr.replacingOccurrences(of: "#", with: "")
        let numberString = Int(midNmbr)
        
        return numberString!
    }
    
    
  
    
}

protocol FetchedPokemon {
    func OnFinishedLoading()
}


class PokemonObject
{
    var pokemon_UIImage: UIImage?
    var pokemon : Pokemon
    var delegate: FetchedPokemon?
    var pokemon_UIGif: UIImage?
    
    init(pokemon:Pokemon) {
        self.pokemon = pokemon
        
        self.pokemon.getPokemonContent()
        
        fetchPokemonImage()
    }
    
    
    func fetchPokemonImage()
    {
        AF.request(self.pokemon.pokemon_imagesrc).responseImage(completionHandler:{
            
            response in
            
            if case .success(let image) = response.result
            {
                self.pokemon_UIImage = image
                //print(self.pokemon.id + " " + self.pokemon.name)
            }
            
            self.fetchPokemonGif()
                        
        })
    }
    
    func fetchPokemonGif()
    {
        AF.request(self.pokemon.pokemon_gifsrc).responseImage(completionHandler:{
            
            response in
            
            if case .success(let image) = response.result
            {
                self.pokemon_UIGif = image
                //print(self.pokemon.id + " " + self.pokemon.name)
                self.delegate?.OnFinishedLoading()
            }
                        
        })
    }
}

//
//  PokeBank.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 20/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import Foundation
import UIKit

class PokeBank{
    
    static let shared = PokeBank()
    
    var PokemonBank: [PokemonObject] = []
    
    func getPokemonGifURL(pokemonID: String) -> String
    {
        var gifURL : String = ""
        
        for pokemon in PokemonBank {
            if gifURL.isEmpty
            {
                if pokemon.pokemon.id == pokemonID
                {
                    gifURL = pokemon.pokemon.pokemon_gifsrc
                }
            }
            
            else
            {
                break
            }
        }
        
        return gifURL
    }
    
   
    func getPokemonTypeImage(type: String)-> UIImage
    {
        switch type {
        case "Normal":
            return UIImage(named: "normal")!
        case "Dragon":
            return UIImage(named: "dragon")!
        case "Psychic":
            return UIImage(named: "psiquico")!
        case "Electric":
            return UIImage(named: "electrico")!
        case "Ground":
            return UIImage(named: "tierra")!
        case "Grass":
            return UIImage(named: "hoja")!
        case "Poison":
            return UIImage(named: "venenoso")!
        case "Steel":
            return UIImage(named: "acero")!
        case "Fairy":
            return UIImage(named: "fairy")!
        case "Fire":
            return UIImage(named: "fuego")!
        case "Fighting":
            return UIImage(named: "luchador")!
        case "Flying":
            return UIImage(named: "volador")!
        case "Bug":
            return UIImage(named: "bicho")!
        case "Ghost":
            return UIImage(named: "fantasma")!
        case "Dark":
            return UIImage(named: "dark")!
        case "Ice":
            return UIImage(named: "hielo")!
        case "Water":
        return UIImage(named: "agua")!
        default:
            return UIImage(named: "roca")!
        }
    }
    
    func getPokemonIDCardBackgroundColor(types: [String]) -> [UIColor]
    {
        var finalColors: [UIColor]?
        
        if types.count > 1
        {
            let type0 = getPokemonTypeGradient(type: types[0])
            let type1 = getPokemonTypeGradient(type: types[1])
            
            finalColors = type0 + type1
        }
        
        else
        {
            finalColors = getPokemonTypeGradient(type: types[0])
        }
        
        return finalColors!
    }
    
    func getPokemonTypeGradient(type: String) -> [UIColor]
    {
        switch type {
        case "Normal":
            let normalGradient : [UIColor] =
                [UIColor(red: 229, green: 223, blue: 207),
                 UIColor(red: 160, green: 149, blue: 121),
                 UIColor(red: 85, green: 77, blue: 58)]
            return normalGradient
            
        case "Dragon":
            let dragonGradient : [UIColor] =
            [UIColor(red: 88, green: 142, blue: 196),
             UIColor(red: 62, green: 26, blue: 144),
             UIColor(red: 58, green: 10, blue: 116)]
            return dragonGradient
            
        case "Psychic":
            let psychicGradient : [UIColor] =
            [UIColor(red: 236, green: 186, blue: 240),
             UIColor(red: 240, green: 148, blue: 237),
             UIColor(red: 177, green: 19, blue: 190)]
            return psychicGradient
            
        case "Electric":
           let electricGradient : [UIColor] =
            [UIColor(red: 246, green: 223, blue: 108),
             UIColor(red: 245, green: 195, blue: 104),
             UIColor(red: 254, green: 174, blue: 27)]
            return electricGradient
            
        case "Ground":
            let groundGradient : [UIColor] =
            [UIColor(red: 242, green: 234, blue: 219),
             UIColor(red: 213, green: 193, blue: 150),
             UIColor(red: 157, green: 131, blue: 73)]
            return groundGradient
            
        case "Grass":
            let grassGradient : [UIColor] =
            [UIColor(red: 148, green: 222, blue: 138),
             UIColor(red: 98, green: 198, blue: 85),
             UIColor(red: 62, green: 123, blue: 54)]
            return grassGradient
            
        case "Poison":
            let poisonGradient : [UIColor] =
            [UIColor(red: 230, green: 72, blue: 250),
             UIColor(red: 155, green: 32, blue: 209),
             UIColor(red: 81, green: 8, blue: 126)]
            return poisonGradient
            
        case "Steel":
            let steelGradient : [UIColor] =
            [UIColor(red: 239, green: 239, blue: 239),
             UIColor(red: 154, green: 154, blue: 154),
             UIColor(red: 85, green: 85, blue: 85)]
            return steelGradient
            
        case "Fairy":
            let fairyGradient : [UIColor] =
            [UIColor(red: 248, green: 191, blue: 248),
             UIColor(red: 242, green: 157, blue: 157),
             UIColor(red: 247, green: 127, blue: 247)]
            return fairyGradient
            
        case "Fire":
            let fireGradient : [UIColor] =
            [UIColor(red: 247, green: 122, blue: 38),
             UIColor(red: 251, green: 106, blue: 61),
             UIColor(red: 197, green: 66, blue: 22)]
            return fireGradient

        case "Fighting":
            let fightingGradient : [UIColor] =
            [UIColor(red: 242, green: 157, blue: 157),
             UIColor(red: 226, green: 117, blue: 117),
             UIColor(red: 150, green: 13, blue: 13)]
            return fightingGradient
            
        case "Flying":
            let flyingGradient : [UIColor] =
            [UIColor(red: 236, green: 209, blue: 255),
             UIColor(red: 210, green: 147, blue: 255),
             UIColor(red: 175, green: 68, blue: 252)]
            return flyingGradient
            
        case "Bug":
            let bugGradient : [UIColor] =
            [UIColor(red: 208, green: 240, blue: 203),
             UIColor(red: 148, green: 222, blue: 138),
             UIColor(red: 81, green: 195, blue: 66)]
            return bugGradient

        case "Ghost":
            let ghostGradient : [UIColor] =
            [UIColor(red: 70, green: 0, blue: 255),
             UIColor(red: 52, green: 1, blue: 188),
             UIColor(red: 16, green: 2, blue: 56)]
            return ghostGradient


        case "Dark":
            let darkGradient : [UIColor] =
            [UIColor(red: 217, green: 217, blue: 217),
             UIColor(red: 111, green: 111, blue: 111),
             UIColor(red: 18, green: 18, blue: 18)]
            return darkGradient

        case "Ice":
            let iceGradient : [UIColor] =
            [UIColor(red: 216, green: 250, blue: 248),
             UIColor(red: 119, green: 247, blue: 237),
             UIColor(red: 29, green: 213, blue: 198)]
            return iceGradient

        case "Water":
            let waterGradient : [UIColor] =
            [UIColor(red: 136, green: 198, blue: 242),
             UIColor(red: 87, green: 172, blue: 244),
             UIColor(red: 10, green: 121, blue: 216)]
            return waterGradient

        default:
            let rockGradient : [UIColor] =
            [UIColor(red: 230, green: 215, blue: 176),
             UIColor(red: 173, green: 147, blue: 83),
             UIColor(red: 111, green: 86, blue: 24)]
            return rockGradient
        }
    }
}

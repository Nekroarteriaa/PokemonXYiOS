//
//  ViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 20/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let color1 = UIColor().colorFromHex("F77A26")
        let color2 = UIColor().colorFromHex("FB6A3D")
        let color3 = UIColor().colorFromHex("C54216")
        

     
        
        GetPokemon()
        

    }
    
    func GetPokemon()
    {
        let request = AF.request("https://gist.githubusercontent.com/mrcsxsiq/b94dbe9ab67147b642baa9109ce16e44/raw/97811a5df2df7304b5bc4fbb9ee018a0339b8a38")
        .validate()
            .responseJSON(completionHandler: {(response) in
                if let pkmnListJson = response.value as? [NSDictionary]
                {
                    
                    for item in pkmnListJson
                    {
                        var pokemon = Pokemon(pkmn: item)
                        PokeBank.shared.PokemonBank.append(pokemon)
                        
                        pokemon.getPokemonContent()

                    }
                }
            })
    }


}

extension UIColor {
  
    func colorFromHex(_ hex: String) -> UIColor {
        
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#")
        {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6
        {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16 / 255),
                            green: CGFloat((rgb & 0x00FF00) >> 8 / 255),
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
}



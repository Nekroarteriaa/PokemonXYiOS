//
//  ViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 20/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import Alamofire
import CCGradient

class ViewController: UIViewController {

   // @IBOutlet weak var gradientView: CCGradientView!
    @IBOutlet weak var gradientView: CCGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        gradientView.configuration = self
        

     
        
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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}


extension ViewController: CCGradientViewConfiguration {
    func configurationForGradientView(_ gradientView: CCGradientView) -> CCGradientConfiguration {
        
        let color4 = UIColor(red: 247, green: 122, blue: 38)
        let color5 = UIColor(red: 251, green: 106, blue: 61)
        let color6 = UIColor(red: 197, green: 66, blue: 22)
        return CCGradientConfiguration(colors: [color4, color5, color6],
                                       
                                       type: CCGradientType.radial,
                                       locations: [0.25, 0.75],
                                       points: [CGPoint(x: 0.5, y: 0.55),
                                                CGPoint(x: 1.5, y: 1)]
                                       
                                       
                                       /*,
                                       locations: [0.25,0.95,0.25],
                                        points: [CGPoint(x: 0.5, y: 0.5),
                                        CGPoint(x: 1, y: 1)]*/)
    }
}

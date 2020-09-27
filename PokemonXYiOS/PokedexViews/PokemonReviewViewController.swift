//
//  PokemonReviewViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 26/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import CCGradient

class PokemonReviewViewController: UIViewController {
    
    var gradientView = CCGradientView()
     var backgroundGradient: [UIColor]?
    var desiredPokemon: PokemonObject?

    @IBOutlet weak var pokemonIDImageProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(desiredPokemon!.pokemon.name)

        // Do any additional setup after loading the view.
    }
    
    func setDesiredPokemon(pkmnObj: PokemonObject)  {
        self.desiredPokemon = pkmnObj
        
        backgroundGradient = PokeBank.shared.getPokemonIDCardBackgroundColor(types: self.desiredPokemon!.pokemon.typeofpokemon)
        setIDCardBackground()
    }
    
    func setIDCardBackground()
       {
           
          view.addSubview(gradientView)
          gradientView.translatesAutoresizingMaskIntoConstraints = false
          gradientView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
          gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
          
          view.sendSubviewToBack(gradientView)
           gradientView.configuration = self
           
           settingVariables()
           
       }
    
    func settingVariables()
    {
        pokemonIDImageProfile.image = desiredPokemon?.pokemon_UIGif!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension PokemonReviewViewController: CCGradientViewConfiguration {
    public func configurationForGradientView(_ gradientView: CCGradientView) -> CCGradientConfiguration {
        
        /*let color4 = UIColor(red: 247, green: 122, blue: 38)
        let color5 = UIColor(red: 251, green: 106, blue: 61)
        let color6 = UIColor(red: 197, green: 66, blue: 22)*/
        return CCGradientConfiguration(colors: self.backgroundGradient!,
                                       type: CCGradientType.axial,
                                       points: [CGPoint(x: 0.0, y: 0.8),
                                                CGPoint(x: 1, y: 1)]
                                       /*,
                                       locations: [0.25, 0.75],
                                       points: [CGPoint(x: 0.5, y: 0.55),
                                                CGPoint(x: 1.5, y: 1)]*/
                                       
                                       
                                       /*,
                                       locations: [0.25,0.95,0.25],
                                        points: [CGPoint(x: 0.5, y: 0.5),
                                        CGPoint(x: 1, y: 1)]*/)
    }
}

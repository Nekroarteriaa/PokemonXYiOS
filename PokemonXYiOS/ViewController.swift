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

class ViewController: UIViewController, FetchedPokemon {
   
    

   // @IBOutlet weak var gradientView: CCGradientView!
    var gradientView = CCGradientView()
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var indexLoadedPokemon: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

           
        setBackground()

        GetPokemon()
    }
    
    func setBackground()
    {
        spinner.startAnimating()
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.sendSubviewToBack(gradientView)
         gradientView.configuration = self
        

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
                        var myPokemon = Pokemon(pkmn: item)
                        var pokemonObj = PokemonObject(pokemon: myPokemon)
                        pokemonObj.delegate = self
                        PokeBank.shared.PokemonBank.append(pokemonObj)
                        
                        

                    }
                    
                    //Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.changeViewToTable), userInfo: nil, repeats: false)
                }
            })
    }
    
    @objc func changeViewToTable()
    {
        spinner.stopAnimating()
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let pokelistViewController = mainStoryboard.instantiateViewController(identifier: "PokemonListView") as? PokemonListTableViewController else{
            print("nanai")
            return
        }
                
        navigationController?.pushViewController(pokelistViewController, animated: true)
    }
    
    func OnFinishedLoading()
    {
           indexLoadedPokemon += 1
        print(indexLoadedPokemon)
        if indexLoadedPokemon == PokeBank.shared.PokemonBank.count
        {
           
           changeViewToTable()
        }
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

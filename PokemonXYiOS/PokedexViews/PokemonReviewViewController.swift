//
//  PokemonReviewViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 26/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

class PokemonReviewViewController: UIViewController {
    
    var desiredPokemon: PokemonObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(desiredPokemon?.pokemon.name)

        // Do any additional setup after loading the view.
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

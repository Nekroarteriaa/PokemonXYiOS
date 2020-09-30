//
//  EvolvesBaseViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 30/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

 open class EvolvesBaseViewController: UIViewController {

    @IBOutlet weak var PokemonGifCollectionView: UICollectionView!
    var selectedPokemon: PokemonObject?
    var reviewViewController: PokemonReviewViewController?
    var aboutViewController: AboutViewController?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

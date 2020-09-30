//
//  ForthEvolvesViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 30/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

class ForthEvolvesViewController: EvolvesBaseViewController,
    UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var PokemonGifCollectionVerticalView: UICollectionView!
    
    var firstTwoEvolutions: [String] = []
    var secondTwoEvolutions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PokemonGifCollectionView.delegate = self
        PokemonGifCollectionView.dataSource = self
        
        PokemonGifCollectionVerticalView.delegate = self
        PokemonGifCollectionVerticalView.dataSource = self
        
        // Do any additional setup after loading the view.
        orderingEvolves()
    }
    
    func orderingEvolves()
    {
        firstTwoEvolutions.append(selectedPokemon!.pokemon.evolutions[0])
        firstTwoEvolutions.append(selectedPokemon!.pokemon.evolutions[1])
        
        secondTwoEvolutions.append(selectedPokemon!.pokemon.evolutions[2])
        secondTwoEvolutions.append(selectedPokemon!.pokemon.evolutions[3])
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == PokemonGifCollectionView
        {
            return firstTwoEvolutions.count
        }
        else
        {
            return secondTwoEvolutions.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == PokemonGifCollectionView
        {
            let cell = PokemonGifCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstEvolves", for: indexPath) as! PokemonEvolutionCollectionViewCell
            
            cell.PokemonGifHolderImageVIew.image = selectedPokemon?.pokemon_EvolvesUIGif[indexPath.row]
            
            return cell
        }
        
        else
        {
            let cell = PokemonGifCollectionVerticalView.dequeueReusableCell(withReuseIdentifier: "SecondEvolves", for: indexPath) as! PokemonEvolutionCollectionViewCell
            
            cell.PokemonGifHolderImageVIew.image = selectedPokemon?.pokemon_EvolvesUIGif[indexPath.row + 2]
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }

        let cellCount = CGFloat(collectionView.numberOfItems(inSection: section))

        if cellCount > 0 {
            let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing

            let totalCellWidth = cellWidth * cellCount
            let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right - flowLayout.headerReferenceSize.width - flowLayout.footerReferenceSize.width

            if (totalCellWidth < contentWidth) {
                let padding = (contentWidth - totalCellWidth + flowLayout.minimumInteritemSpacing) / 2.0
                return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
            }
        }

        return .zero
    }

}

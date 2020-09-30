//
//  EeveeEvolvesViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 30/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

class EeveeEvolvesViewController: EvolvesBaseViewController, UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonGifCollectionView.delegate = self
        PokemonGifCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       selectedPokemon!.pokemon.evolutions.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
       let cellEvolutions = PokemonGifCollectionView.dequeueReusableCell(withReuseIdentifier: "EeveeCell", for: indexPath) as! PokemonEvolutionCollectionViewCell
       
       cellEvolutions.PokemonGifHolderImageVIew.image = selectedPokemon?.pokemon_EvolvesUIGif[indexPath.row]
       
       return cellEvolutions
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

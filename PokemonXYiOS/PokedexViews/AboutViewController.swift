//
//  AboutViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 27/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var PokemonDescriptionLabel: UILabel!
    @IBOutlet weak var PokemonHeightLabel: UILabel!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    @IBOutlet weak var PokemonWeightLabel: UILabel!
    
    @IBOutlet weak var typeBadgeCollectionView: UICollectionView!
    
    @IBOutlet weak var weaknessBadgeCollectionView: UICollectionView!
    
    @IBOutlet weak var MalePercentageLabel: UILabel!
    
    @IBOutlet weak var FemalePercentageLabel: UILabel!
    
    var selectedPokemon: PokemonObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        typeBadgeCollectionView.delegate = self
        typeBadgeCollectionView.dataSource = self
        
        weaknessBadgeCollectionView.delegate = self
        weaknessBadgeCollectionView.dataSource = self
        
        setupUIContent()
    }
    
    func setupUIContent()
    {
        PokemonDescriptionLabel.text = selectedPokemon?.pokemon.xdescription
        PokemonHeightLabel.text = "Height: " + "\(convertFeetsToMeters(heightInFeets: (selectedPokemon?.pokemon.height)!))" + " m"
        
        
        CategoryLabel.text = selectedPokemon?.pokemon.category
        
        
        PokemonWeightLabel.text = "Weight: " + "\(convertLibrasToKilos(weightInLibras: (selectedPokemon?.pokemon.weight)!))" + " kg"
        
        MalePercentageLabel.text = selectedPokemon?.pokemon.male_percentage
        FemalePercentageLabel.text = selectedPokemon?.pokemon.female_percentage
    
        
        /*typeBadgeCollectionView.collectionViewLayout.collectionView?.presentationSectionIndex(forDataSourceSectionIndex: 30)*/
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == weaknessBadgeCollectionView
        {
            return selectedPokemon!.pokemon.weaknesses.count
        }
        else
        {
            return selectedPokemon!.pokemon.typeofpokemon.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == weaknessBadgeCollectionView
        {
            let cellweaknessType = weaknessBadgeCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionWeaknessCell", for: indexPath) as! WeaknessTypeCollectionViewCell
            
            cellweaknessType.WeaknessImageView.image = PokeBank.shared.getPokemonTypeImage(type: selectedPokemon!.pokemon.weaknesses[indexPath.row])
            
            return cellweaknessType
        }
        
        else
        {
            let cellType = typeBadgeCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionTypesCell", for: indexPath) as! TypeSymbolCollectionViewCell
            
            
            
            
            cellType.badgeImageView.image = PokeBank.shared.getPokemonTypeImage(type: selectedPokemon!.pokemon.typeofpokemon[indexPath.row])
            
             return cellType
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



extension AboutViewController
{
    func convertFeetsToMeters(heightInFeets : String)->Float
    {
        let splitted = heightInFeets.components(separatedBy: "'")
        
        let feets = splitted[0]
        var inches = splitted[1]
        
        inches = inches.replacingOccurrences(of: " ", with: "")
        inches = inches.replacingOccurrences(of: "\"", with: "")
        
        var feettoMeeters = Float(feets)
        feettoMeeters = feettoMeeters! / 3.2808
        
        var inchestoMeters = Float(inches)
        inchestoMeters = inchestoMeters! / 39.370
        
        feettoMeeters = feettoMeeters! + inchestoMeters!
        
        var formatted = String(format: "%.2f", feettoMeeters!)
        formatted = formatted.replacingOccurrences(of: ",", with: ".")
        
        let heightInMeters = Float(formatted)
        
        return heightInMeters!
        
    }
    
    func convertLibrasToKilos(weightInLibras: String) -> Float
    {
        var lbs = weightInLibras.replacingOccurrences(of: " ", with: "")
        lbs = lbs.replacingOccurrences(of: "lbs", with: "")
        
        var weightToKilos = Float(lbs)
        weightToKilos = weightToKilos! / 2.2046
        
        var formatted = String(format: "%.2f", weightToKilos!)
        formatted = formatted.replacingOccurrences(of: ",", with: ".")
        
        let weightInKilos = Float(formatted)
        return weightInKilos!
    }
}

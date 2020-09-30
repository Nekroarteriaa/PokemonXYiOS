//
//  StatsViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 30/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import MultiProgressView

class StatsViewController: UIViewController  {
   
    @IBOutlet weak var HPProgressBar: MultiProgressView!
    @IBOutlet weak var AttackProgressBar: MultiProgressView!
    @IBOutlet weak var DefenseProgressBar: MultiProgressView!
    @IBOutlet weak var SpecialAttackProgressBar: MultiProgressView!
    @IBOutlet weak var SpecialDefenseProgressBar: MultiProgressView!
    @IBOutlet weak var SpeedProgressBar: MultiProgressView!
    @IBOutlet weak var TotalProgressBar: MultiProgressView!
    
    var hPData: Float = 0.0
    var attackData: Float = 0.0
    var defenseData: Float = 0.0
    var specialAttackData: Float = 0.0
    var specialDefenseData: Float = 0.0
    var speedData: Float = 0.0
    var totalData: Float = 0.0
    
    var selectedPokemon: PokemonObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HPProgressBar.dataSource = self
        AttackProgressBar.dataSource = self
        DefenseProgressBar.dataSource = self
        SpecialAttackProgressBar.dataSource = self
        SpecialDefenseProgressBar.dataSource = self
        SpeedProgressBar.dataSource = self
        TotalProgressBar.dataSource = self
        
        settingPokemonStats(pokemon: selectedPokemon!)
    }
    
    func settingPokemonStats(pokemon: PokemonObject)
    {
        self.hPData = Float(pokemon.pokemon.hp)/100
        self.attackData = Float(pokemon.pokemon.attack)/100
        self.defenseData = Float(pokemon.pokemon.defense)/100
        self.specialAttackData = Float(pokemon.pokemon.special_attack)/100
        self.specialDefenseData = Float(pokemon.pokemon.special_defense)/100
        self.speedData = Float(pokemon.pokemon.speed)/100
        self.totalData = Float(pokemon.pokemon.total)
        
        self.totalData = self.totalData / 370
        
        
        
        
        /* 370 -> 100
            160 - x
         */
        
    }
    
    func animateStatsBar()
    {
        animateSetProgress(HPProgressBar, firstProgress: hPData, secondProgress: 0)
        animateSetProgress(AttackProgressBar, firstProgress: attackData, secondProgress: 0)
        animateSetProgress(DefenseProgressBar, firstProgress: defenseData, secondProgress: 0)
        animateSetProgress(SpecialAttackProgressBar, firstProgress: specialAttackData, secondProgress: 0)
        animateSetProgress(SpecialDefenseProgressBar, firstProgress: specialDefenseData, secondProgress: 0)
        animateSetProgress(SpeedProgressBar, firstProgress: speedData, secondProgress: 0)
        animateSetProgress(TotalProgressBar, firstProgress: totalData, secondProgress: 0)
    }
    
    func restartStatsBar()
    {
        animateSetProgress(HPProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(AttackProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(DefenseProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(SpecialAttackProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(SpecialDefenseProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(SpeedProgressBar, firstProgress: 0, secondProgress: 0)
        animateSetProgress(TotalProgressBar, firstProgress: 0, secondProgress: 0)
    }
    
}

extension StatsViewController: MultiProgressViewDataSource
{
    func numberOfSections(in progressView: MultiProgressView) -> Int
    {
        return 7
    }
    
    func progressView(_ progressView: MultiProgressView, viewForSection section: Int) -> ProgressViewSection
    {
        let sectionView = ProgressViewSection()
        switch section {
        case 0:
            sectionView.backgroundColor = UIColor.green
        case 1:
            sectionView.backgroundColor = UIColor.red
        default:
            break
        }
        return sectionView
    }
    
    private func animateSetProgress(_ progressView: MultiProgressView, firstProgress: Float, secondProgress: Float) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            progressView.setProgress(section: 0, to: firstProgress)
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
                progressView.setProgress(section: 1, to: secondProgress)
            }, completion: nil)
        }
    }
}

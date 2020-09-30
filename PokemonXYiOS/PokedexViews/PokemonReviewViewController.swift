//
//  PokemonReviewViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 26/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import CCGradient
import SwipeMenuViewController

class PokemonReviewViewController: UIViewController {
    
    var tabElements: [String] = ["ABOUT", "EVOLVES", "STATS", "MOVES"]
    
    var gradientView = CCGradientView()
     var backgroundGradient: [UIColor]?
    var desiredPokemon: PokemonObject?
    

    @IBOutlet weak var pokemonIDImageProfile: UIImageView!
    @IBOutlet weak var pokemonIDNumberLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var swipeView: SwipeMenuView!
    
    
    var about: AboutViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var aboutViewController = storyboard.instantiateViewController(identifier: "PokemonAboutView") as! AboutViewController
        
        return aboutViewController
    }()
    
    var evolves: EvolvesBaseViewController?
    
    let vc3 = ContentViewController()
    let vc4 = ContentViewController()
    
    var views:[UIViewController] = []
    
    
    override func viewDidLoad() {
        
        let vc = self.about
        vc.selectedPokemon = desiredPokemon
        
        var vc2 : EvolvesBaseViewController?
        
        if desiredPokemon!.pokemon.evolutions.count > 3
        {
            if desiredPokemon!.pokemon.evolutions.count > 4
            {
                self.evolves = {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    
                    let evolvesViewController = storyboard.instantiateViewController(identifier: "PokemonEeveeEvolvesView") as! EeveeEvolvesViewController
                    
                    return evolvesViewController
                }()
            }
            
            else
            {
                self.evolves = {
                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    
                    let evolvesViewController = storyboard.instantiateViewController(identifier: "PokemonForthEvolvesView") as! ForthEvolvesViewController
                    
                    return evolvesViewController
                }()
            }
        }
        
        else
        {
            self.evolves = {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
                let evolvesViewController = storyboard.instantiateViewController(identifier: "PokemonNormalEvolvesView") as! NormalEvolveChainViewController
                
                return evolvesViewController
            }()
            
        }
        
        vc2 = self.evolves
        vc2!.selectedPokemon = desiredPokemon
        vc2!.reviewViewController = self
        vc2!.aboutViewController = self.about
        
        views.append(vc)
        views.append(vc2!)
        views.append(vc3)
        views.append(vc4)
        
        super.viewDidLoad()
        
       
    
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
        desiredPokemon?.fetchPokemonGif()
        pokemonIDImageProfile.image = desiredPokemon?.pokemon_UIGif!
        
        if desiredPokemon!.pokemon.evolutions.count < 5
        {
            desiredPokemon?.fetchEvolvesGif(evolvesList: desiredPokemon!.pokemon.evolutions)
        }
        
        else
        {
            let _orderedEvolves = PokeBank.shared.orderingEeveeEvolves()
            desiredPokemon?.fetchEvolvesGif(evolvesList: _orderedEvolves)
        }
        
 
        pokemonIDNumberLabel.text  = desiredPokemon?.pokemon.id
        pokemonNameLabel.text = desiredPokemon?.pokemon.name
        pokemonNameLabel.setCharacterSpacing(1.5)
        

        
        swipeView.delegate = self
        swipeView.dataSource = self
        
        swipeView.layer.cornerRadius = swipeView.frame.height/2
           
        var options: SwipeMenuViewOptions = .init()
        options.tabView.itemView.margin = 18
        options.tabView.backgroundColor = UIColor.white
        swipeView.reloadData(options: options)
        
        setVCtoInformationView()
    }
    
    
    func setVCtoInformationView()
    {
        /*informationView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        holderView.bounds = informationView.bounds
        holderView.addSubview(vc.view)*/
        
        /*
        informationView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.bounds = informationView.bounds*/
        

    }
    
    func setVCConstraints()
    {
        /*vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        vc.view.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        vc.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        */
    }
    
}


extension PokemonReviewViewController: CCGradientViewConfiguration {
    public func configurationForGradientView(_ gradientView: CCGradientView) -> CCGradientConfiguration {
        
        /*let color4 = UIColor(red: 247, green: 122, blue: 38)
        let color5 = UIColor(red: 251, green: 106, blue: 61)
        let color6 = UIColor(red: 197, green: 66, blue: 22)*/
        return CCGradientConfiguration(colors: self.backgroundGradient!,
                                       type: CCGradientType.axial,
                                       points: [CGPoint(x: 0.0, y: 0.0),
                                                CGPoint(x: 0.5, y: 1.5)]
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

extension PokemonReviewViewController: SwipeMenuViewDelegate {

    // MARK - SwipeMenuViewDelegate
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        // Codes
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        // Codes
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        
        
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        
        switch toIndex {
        case 1:
            return
        case 2:
            vc3.view.backgroundColor = UIColor.red
        case 3:
            vc4.view.backgroundColor = UIColor.yellow
        default:
             return
        }
    }
}


extension PokemonReviewViewController: SwipeMenuViewDataSource {

    //MARK - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return tabElements.count
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return tabElements[index]
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        return views[index]
    }
}



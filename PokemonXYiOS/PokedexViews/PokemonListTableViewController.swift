//
//  PokemonListTableViewController.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 21/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit

class PokemonListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.reloadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PokeBank.shared.PokemonBank.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let myCell = cell as! PokemonIDCardTableViewCell
        
        let item = PokeBank.shared.PokemonBank[indexPath.row]
        
        myCell.PokemonImage.image = PokeBank.shared.PokemonBank[indexPath.row].pokemon_UIImage
        
       // cell.textLabel?.text = item.pokemon.name
        myCell.NameLabel.text = item.pokemon.name
        myCell.IDLabel.text = item.pokemon.id
        
        myCell.hideContentbyTypes(types: item.pokemon.typeofpokemon)

        return myCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        

        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
               
               guard let pokelistViewController = mainStoryboard.instantiateViewController(identifier: "PokemonDetail") as? PokemonReviewViewController else{
                   print("nanai")
                   return
               }
        
                let item = PokeBank.shared.PokemonBank[indexPath.row]
               
            pokelistViewController.setDesiredPokemon(pkmnObj: item)
               navigationController?.pushViewController(pokelistViewController, animated: true)

        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

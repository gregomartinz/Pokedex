//
//  RacesTableViewController.swift
//  Pokedex
//
//  Created by Gregorio Martínez Luque on 20/11/15.
//  Copyright © 2015 Gregorio Martínez Luque. All rights reserved.
//

import UIKit

class RacesTableViewController: UITableViewController {
    
    var pokedexModel = PokedexModel()

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //Este método nos devuleve el número de secciones dentro de la tabla. En este caso las
    // clases de pokemons que tenemos.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return pokedexModel.types.count
    }
    
    // Proporciona el número de pokemons en cada una de las clases.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //let type = pokedexModel.types[section]
            //return type.races.count
        return 1
    }
    
    // Rellena cada celda con el pokemon correspondiente.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Race Cell", forIndexPath: indexPath)
            
            let type = pokedexModel.types[indexPath.section]
        
            cell.textLabel?.text = type.name
    
            return cell
    }
    
    @IBAction func goHome(segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Pokemon" {
            
            // El destino del segue es el Navigation Controller.
            // El primer VC apuntado por el Navigation Controller el WebVC.
            // sender es la celda de la tabla que disparo el segue.
            if let ctvc = segue.destinationViewController as? ClasesTableViewController,
            let cell = sender! as? UITableViewCell,
            let ip = tableView.indexPathForCell(cell) {
                
                ctvc.type = pokedexModel.types[ip.section]
            }
        }
    }

}

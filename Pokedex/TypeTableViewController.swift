//
//  TypeTableViewController.swift
//  Pokedex
//
//  Created by Gregorio Martínez Luque on 25/11/15.
//  Copyright © 2015 Gregorio Martínez Luque. All rights reserved.
//

import UIKit

class TypeTableViewController: UITableViewController {
    
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
        return 1
    }
    
    // Rellena cada celda con el tipo de pokemons correspondiente.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Race Cell", forIndexPath: indexPath)
        
        let type = pokedexModel.types[indexPath.section]
        
        cell.imageView?.image = UIImage(named: type.name + ".gif")
        cell.textLabel?.text = type.name
        
        return cell
    }
    
    @IBAction func goHome(segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Pokemon" {
            
            if let trtvc = segue.destinationViewController as? TypeRacesTableViewController,
                let cell = sender! as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {
                    
                    trtvc.type = pokedexModel.types[ip.section]
            }
        }
    }


}

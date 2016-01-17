//
//  TypeRacesTableViewController.swift
//  Pokedex
//
//  Created by Gregorio Martínez Luque on 25/11/15.
//  Copyright © 2015 Gregorio Martínez Luque. All rights reserved.
//

import UIKit

class TypeRacesTableViewController: UITableViewController {
    
    var pokedexModel = PokedexModel()
    var type : Type?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return type!.races.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Pokemon Cell", forIndexPath: indexPath)
        
        let race = type!.races[indexPath.section]
        
        cell.imageView?.image = UIImage(named: race.icon)
        cell.textLabel?.text = race.name
        cell.detailTextLabel?.text = race.code
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Web Info" {
            
            // El destino del segue es el Navigation Controller.
            // El primer VC apuntado por el Navigation Controller el WebVC.
            // sender es la celda de la tabla que disparo el segue.
            if let nc = segue.destinationViewController as? UINavigationController,
                let wvc = nc.topViewController as? WebViewController,
                let cell = sender! as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {
                    
                    
                    wvc.race = type!.races[ip.section]
                    
                    wvc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    wvc.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}

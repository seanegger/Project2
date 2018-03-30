//
//  FavoritesTableViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var sightFavorites : [Sight] = []
    var tourFavorites : [Tour] = []
    var all : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sightdi = DataInterface(fileName: "SightFavorites")
        if let data = sightdi.loadSightData() as [Sight]? {
            self.sightFavorites = data
        }
        else
        {
            print("no")
        }
        let tourdi = DataInterface(fileName: "TourFavorites")
        if let data = tourdi.loadTourData() as [Tour]? {
            self.tourFavorites = data
        }
        else
        {
            print("no")
        }
        
        for i in sightFavorites{
            all.add(i)
        }
        for i in tourFavorites{
            all.add(i)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteViewCell", for: indexPath) as! FavoriteViewCell
        let obj = all.object(at: indexPath.row)
        if obj is Sight {
            let temp : Sight = obj as! Sight
            cell.nameLabel.text = temp.name
        }
        else if obj is Tour {
            let temp : Tour = obj as! Tour
            cell.nameLabel.text = temp.name
        }
        else if obj is Note {
            let temp : Note = obj as! Note
            cell.nameLabel.text = temp.text
        }
        // Configure the cell...
        cell.nameLabel.sizeToFit()
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.sightFavorites.remove(at: indexPath.row)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = sightFavorites[fromIndexPath.row]
        sightFavorites[fromIndexPath.row] = sightFavorites[to.row]
        sightFavorites[to.row] = temp
        
    }
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

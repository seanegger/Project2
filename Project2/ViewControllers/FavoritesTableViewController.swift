//
//  FavoritesTableViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {

    var favorites : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let file = Bundle.main.path(forResource: "sights", ofType: "plist")
        let sights = NSArray(contentsOfFile: file!) as! [Dictionary<String, Any>]
        for sight in sights{
            if (sight["favorite"] as! Bool) == true{ 
                self.favorites.add(Sight(name: sight["name"] as! String, latitude: sight["longitude"] as! Double, longitude: sight["latitude"] as! Double, photo : sight["photo"] as! String, favorite : sight["favorite"] as! Bool))
            }
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
        print(favorites.count)
        return favorites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteViewCell", for: indexPath) as! FavoriteViewCell
        let obj = self.favorites.object(at: indexPath.row)
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.favorites.remove(self.favorites.object(at: indexPath.row))
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = favorites.object(at: fromIndexPath.row)
        favorites.replaceObject(at: fromIndexPath.row, with: favorites.object(at: to.row))
        favorites.replaceObject(at: to.row, with: temp)
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

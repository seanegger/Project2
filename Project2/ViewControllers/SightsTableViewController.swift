//
//  SightsTableViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class SightsTableViewController: UITableViewController {

    var sightStore : [Sight] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let file = Bundle.main.path(forResource: "sights", ofType: "plist")
        let sights = NSArray(contentsOfFile: file!) as! [Dictionary<String, Any>]
        for sight in sights{
            
            sightStore.append(Sight(name: sight["name"] as! String, latitude: sight["longitude"] as! Double, longitude: sight["latitude"] as! Double))
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sightStore.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SightTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "SightTableViewCell", for: indexPath) as? SightTableViewCell)!
        
            let sight = sightStore[indexPath.row]
            cell.nameLabel!.text = sight.name
            cell.nameLabel.sizeToFit()
        
        
        
        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        switch segue.identifier{
        case "showSight"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                let sight = sightStore[row]
                let sightDetailViewController = segue.destination as! SightDetailViewController
                print(sight.name)
                sightDetailViewController.sight = sight
            }
            
        default:
            preconditionFailure("Unexpected Segue Failure")
        }
    }
    

}

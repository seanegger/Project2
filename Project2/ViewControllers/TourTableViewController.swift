//
//  TourTableViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit
import AVKit

class TourTableViewController: UITableViewController {
    
    var tourStore : [Tour] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let file = Bundle.main.path(forResource: "tours", ofType: "plist")
        let tours = NSArray(contentsOfFile: file!) as! [Dictionary<String, Any>]
        
        for tour in tours{
            tourStore.append(Tour(type: tour["type"] as! String, name: tour["name"] as! String, file : tour["file"] as! String))
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tourStore.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TourTableViewCell", for: indexPath) as! TourTableViewCell
        let tour = tourStore[indexPath.row]
        cell.nameLabel.text = tour.name
        cell.file = tour.file
        if tour.type == "mp3"
        {
            cell.typeLabel.text = "Audio"
        }
        else
        {
            cell.typeLabel.text = "Video"
        }

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
        case "play"?:
            if let row = tableView.indexPathForSelectedRow?.row{
                let tour = tourStore[row]
                let av = segue.destination as! AVPlayerViewController
                let name = tour.file + tour.type
                let player = AVPlayer.init(url: URL(string : name)!)
                av.player = player
                av.player?.play()
            }
        default:
            preconditionFailure("Unexpected Segue Failure")
            
        }
    }
    

}

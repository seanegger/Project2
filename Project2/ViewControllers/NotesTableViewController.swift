//
//  NotesTableViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    
    //MARK: Instance Variables
    var noteList: [Note] = []
    let dataInterface = DataInterface(fileName: "Notes")


    //MARK: Storyboard Connections
    @IBAction func unwindFromNoteDetail(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? NoteDetailViewController, let note = sourceViewController.note
        {
            if let selectedIndexPath = tableView.indexPathForSelectedRow
            {
                //update existing note
                noteList[selectedIndexPath.row] = note
                tableView.reloadData()
            }
            let newIndexPath = IndexPath(row: noteList.count, section:0)
            noteList.append(note)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        //save to file
        dataInterface.saveData(data: noteList)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //load the saved notes
        if let loadNoteList = dataInterface.loadData()
        {
            noteList = loadNoteList
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // only one section so return 1
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return size of list of notes
        return noteList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        //load the thumbnail
        let thumbnail: UIImage = noteList[indexPath.row].thumbnail!
        cell.imageView?.image = thumbnail
        //load the first word of text
        let noteText = noteList[indexPath.row].text
        let indexOfFirstSpace = noteText.index(of: " ") ?? noteText.endIndex
        cell.textLabel?.text = String(noteText[...indexOfFirstSpace])
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
            // Delete the row from the data source
            noteList.remove(at: indexPath.row)
            dataInterface.saveData(data: noteList)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if fromIndexPath != to
        {
            let movedNote = noteList[fromIndexPath.row]
            noteList.remove(at: fromIndexPath.row)
            noteList.insert(movedNote, at: to.row)
        }
    }
    
    // Pass the right note to the detail view controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editNote", sender: noteList[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if adding a new note
        if segue.identifier == "newNote"
        {
            //create a new note and add it to the list
            let note = Note()
            noteList.append(note)
            //set the new note as the detail view controllers note
            let destinationVC = segue.destination as! NoteDetailViewController
            destinationVC.note = note
        }
        // if editing a note
        if segue.identifier == "editNote"
        {
            // set the detail view controllers note as the note to edit
            let destinationVC = segue.destination as! NoteDetailViewController
            destinationVC.note = sender as? Note
        }
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

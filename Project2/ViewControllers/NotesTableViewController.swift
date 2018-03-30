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
        navigationItem.leftBarButtonItem = editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NotesTableViewCell

        // Configure the cell...
        //load the thumbnail
        if let thumbnail: UIImage = noteList[indexPath.row].thumbnail
        {
            cell?.noteThumbnail.image = thumbnail
        }
        cell?.noteTitle.text = noteList[indexPath.row].text
        return cell!
    }
 

    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            noteList.remove(at: indexPath.row)
            dataInterface.saveData(data: noteList)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        if fromIndexPath != to
        {
            let movedNote = noteList[fromIndexPath.row]
            noteList.remove(at: fromIndexPath.row)
            noteList.insert(movedNote, at: to.row)
            dataInterface.saveData(data: noteList)
        }
    }
    
    
    
    /*
     Handles list cells being selected. Performs the editNote segue on selection
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editNote", sender: noteList[indexPath.row])
    }
    
    
    
    //MARK: Segues
    /*
     Triggered when user triggers segue.
     Two cases: editing a note, creating a new note
     New note creates a new note and sends it to the destiantion view controller
     Editing a note gets the note to edit and sends it to the destination view controller
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
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
     Triggered when a user hits save in the NoteDetaiView.
     Updadates the note list and saves to file
    */
    @IBAction func saveNote(sender: UIStoryboardSegue)
    {
        //save to file
        dataInterface.saveData(data: noteList)
        // reload table view
        tableView.reloadData()
    }
 

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
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

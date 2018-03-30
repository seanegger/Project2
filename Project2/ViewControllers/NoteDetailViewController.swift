//
//  NoteDetailViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var note: Note?
    
    
    @IBAction func pickThumbnail(_ sender: UIButton) {
        // create an image picker
        let picker = UIImagePickerController()
        // set image picker settings
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        // present image picker view
        present (picker, animated:  true, completion: nil)
    }
    
    /*
     Neccessary for implementing image picker. Sets the thumbnail and the note thumbnail to the chosen image
    */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        //get the image
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            //set notes thumbnail to the image
            note?.thumbnail = chosenImage
            //set the current NoteDetailView UIImage to the image
            thumbnail.image = chosenImage
        }
        //dismiss the image picker view
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNote(_ sender: Any) {
        // save new text
        if let newText = textBox.text
        {
            note?.text = newText
        }
        //save new thumbnail
        if let newThumbnail = thumbnail.image
        {
            note?.thumbnail = newThumbnail
        }
        performSegue(withIdentifier: "saveNote", sender: sender)
    }
    
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    
    @IBOutlet weak var textBox: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let noteText = note?.text
        {
            textBox.text = noteText
        }
        if let image = note?.thumbnail
        {
            thumbnail.image = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

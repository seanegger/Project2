//
//  NoteDetailViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    
    var note: Note?
    
    
    @IBAction func pickThumbnail(_ sender: UIButton) {
        let picker = PhotoPicker()
        picker.pickPhoto()
        if let chosenImage = picker.image
        {
            note?.thumbnail? = chosenImage
        }
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
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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

//
//  PhotoPicker.swift
//  Project2
//
//  Created by Egger, Sean on 3/28/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class PhotoPicker: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var image: UIImage?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickPhoto()
    {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present (picker, animated:  true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = chosenImage
        dismiss(animated: true, completion: nil)
    }


}

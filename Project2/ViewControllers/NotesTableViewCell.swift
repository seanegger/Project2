//
//  NotesTableViewCell.swift
//  Project2
//
//  Created by Egger, Sean on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var noteThumbnail: UIImageView!
    @IBOutlet weak var noteTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

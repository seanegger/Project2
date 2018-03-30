//
//  SightTableViewCell.swift
//  Project2
//
//  Created by Rulev, Alec on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class SightTableViewCell : UITableViewCell{

    @IBOutlet weak var nameLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
        
}

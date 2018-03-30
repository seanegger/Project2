//
//  TourTableViewCell.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit
import AVKit

class TourTableViewCell : UITableViewCell{
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
  
    
    @IBOutlet weak var typeLabel: UILabel!
    var file : String?
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func configure(file : String){
        self.file = file
        button.setTitle("Go", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    
}

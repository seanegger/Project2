//
//  ExternalLinksTableViewCell.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved

import UIKit

class ExternalLinksTableViewCell : UITableViewCell{

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    var link : String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(nlink : String)
    {
        self.link = nlink
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func goToSite(_ sender: UIButton) {
        let nurl = NSURL(string: self.link!)
        UIApplication.shared.open(nurl! as URL, options: [ :], completionHandler: nil)
    }
    
}

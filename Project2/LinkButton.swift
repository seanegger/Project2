//
//  LinkButton.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit

class LinkButton : UIButton{
    var url : String
    var label : String
    
    
    init(nurl : String, nlabel : String)
    {
        self.url = nurl
        self.label = nlabel
        super.init(type: self as UIButtonType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}

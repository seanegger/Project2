//
//  Link.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation

class Link : NSObject{
    var name : String
    var link : String
    var label : String
    
    init(name : String, link : String)
    {
        self.label = "Go"
        self.name = name
        self.link = link
    }
    
}

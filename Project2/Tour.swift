//
//  Tour.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation

class Tour : NSObject{
    var type : String
    var name: String
    var file : String
    //var favorite : Bool
    
    init(type: String, name: String, file: String)
    {
        self.type = type
        self.name = name
        self.file = file
        //self.favorite = favorite
    }

}

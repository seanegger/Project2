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
    var favorite : Bool
    
    init(type: String, name: String, file: String)
    {
        self.type = type
        self.name = name
        self.file = file
        self.favorite = false
    }
    
    init(type: String, name: String, file: String, favorite : Bool)
    {
        self.type = type
        self.name = name
        self.file = file
        self.favorite = favorite
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyKey.name)
        aCoder.encode(type, forKey: propertyKey.type)
        aCoder.encode(file, forKey: propertyKey.file)
        
        
        aCoder.encode(favorite, forKey: propertyKey.favorite)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String
        let type = aDecoder.decodeObject(forKey: propertyKey.type) as? String
        let file = aDecoder.decodeObject(forKey: propertyKey.file) as? String
        let favorite = aDecoder.decodeObject(forKey: propertyKey.favorite) as? Bool
        self.init(type : type!, name: name!, file : file!, favorite : favorite!)
    }
    
    struct propertyKey{
        static let name = "name"
        static let type = "type"
        static let file = "file"
        static let favorite = "favorite"
    }
}

//
//  Note.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation
import UIKit

class Note: NSObject, NSCoding
{
    
    var text: String = ""
    var thumbnail: UIImage? = nil
    var identifier: Int?

    
    init(text: String, thumbnail: UIImage) {
        self.text = text
        self.thumbnail = thumbnail
    }
    
    override init()
    {
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: propertyKey.text)
        aCoder.encode(thumbnail, forKey: propertyKey.thumbnail)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let text = aDecoder.decodeObject(forKey: propertyKey.text) as? String
        let thumbnail = aDecoder.decodeObject(forKey: propertyKey.thumbnail) as? UIImage
        
        self.init(text: text!, thumbnail: thumbnail!)
    }
    

    struct propertyKey{
        static let text = "text"
        static let thumbnail = "thumbnail"
    }
    
}

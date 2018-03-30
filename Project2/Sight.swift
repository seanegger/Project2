//
//  Sight.swift
//  Project2
//
//  Created by Rulev, Alec on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit
import MapKit

class Sight : NSObject, NSCoding{
    var name : String
    var placeMark : MKPlacemark
    var photo : String
    var favorite : Bool
    
    init(name : String, latitude: Double, longitude: Double, photo : String){
        self.name = name
        self.placeMark = MKPlacemark.init(coordinate: CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude))
        self.photo = photo
        self.favorite = false
        }
    
    init(name : String, latitude: Double, longitude: Double, photo : String, favorite : Bool){
    self.name = name
    self.placeMark = MKPlacemark.init(coordinate: CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude))
    self.photo = photo
    self.favorite = favorite
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyKey.name)
        aCoder.encode(placeMark.coordinate.latitude, forKey: propertyKey.latitude)
        aCoder.encode(placeMark.coordinate.longitude, forKey: propertyKey.longitude)

        aCoder.encode(photo, forKey: propertyKey.photo)

        aCoder.encode(favorite, forKey: propertyKey.favorite)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String
        let latitude = aDecoder.decodeObject(forKey: propertyKey.latitude) as? Double
        let longitude = aDecoder.decodeObject(forKey: propertyKey.longitude) as? Double
        let photo = aDecoder.decodeObject(forKey: propertyKey.photo) as? String
        let favorite = aDecoder.decodeObject(forKey: propertyKey.favorite) as? Bool
        self.init(name: name!, latitude : latitude!, longitude : longitude!, photo : photo!, favorite : favorite!)
    }
    
    struct propertyKey{
        static let name = "text"
        static let favorite = "favorite"
        static let longitude = "longitude"
        static let latitude = "latitude"
        static let photo = "photo"
    }
}

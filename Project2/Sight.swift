//
//  Sight.swift
//  Project2
//
//  Created by Rulev, Alec on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation
import MapKit

class Sight : NSObject{
    var name : String
    var placeMark : MKPlacemark
    var photo : String
    var favorite : Bool
    
    init(name : String, latitude: Double, longitude: Double, photo : String, favorite : Bool){
        self.name = name
        self.placeMark = MKPlacemark.init(coordinate: CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude))
        self.photo = photo
        self.favorite = favorite
        }
}

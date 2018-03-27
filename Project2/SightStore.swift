//
//  SightStore.swift
//  Project2
//
//  Created by Rulev, Alec on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation

class SightStore{
    var allSights : [Sight] = []
    
    func createItem(name : String, latitude : Double, longitude : Double) -> Sight{
        let newSight = Sight(name:name, latitude:latitude, longitude:longitude)
        allSights.append(newSight)
        return newSight
    }
    
    func getSize() -> Int{
        return allSights.count
    }
}

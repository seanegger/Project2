//
//  SightDetailViewController.swift
//  Project2
//
//  Created by Egger, Sean on 3/27/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit
import MapKit

class SightDetailViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var map: MKMapView!
    var sight : Sight!
    var sightStore : [Sight] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: sight.placeMark.coordinate, span: span)
        map.setRegion(region, animated: true)
        map.sizeToFit()
        let ano = MKPointAnnotation()
        ano.coordinate = sight.placeMark.coordinate
        ano.title = sight.name
        map.addAnnotation(ano)
        map.showsUserLocation = true
        image.image = UIImage(named: sight.photo)
        let di : DataInterface = DataInterface(fileName :"SightFavorites")
        if let data = di.loadSightData() as [Sight]? {
            for d in data{
                if d == self.sight{
                    self.sight.favorite = d.favorite
                }
            }
        }
        
        if self.sight.favorite
        {
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
        }
        else{
            self.favoriteButton.setTitle("Favorite", for: .normal)
        }
        
        
        favoriteButton.sizeToFit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // checks if favorited or not
    /*func check()
    {
        if self.favorite! {
            favoriteButton.setTitle("Unfavorite", for: .normal)
            let i = findInList(item : self.sight)
            sightStore[i].favorite = true
            
        }
        else {
            favoriteButton.setTitle("Favorite", for: .normal)
            let i = findInList(item : self.sight)
            sightStore[i].favorite = false
        }
    }*/
    
    // load to DI on view disappearing


    
    func findInList(item: Sight) -> Int {
        var i = 0
        for sight in self.sightStore {
            if sight.name == item.name{
                return i
            }
            i = i + 1
        }
        return -1
    }
    
    //finds if the current item is in the provided array, returns index
 
    
    
    // button function to favorite the item
    @IBAction func favoriteThis(_ sender: Any) {
        sight.favorite = !sight.favorite
        // get favorited sights data
        let di = DataInterface(fileName: "SightFavorites")
        var dataList = di.loadSightData()
        //if its now favorited
        if sight.favorite
        {
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
            dataList?.append(self.sight)
        }
        // if it was just unfavorited
        else
        {
            self.favoriteButton.setTitle("Favorite", for: .normal)

            let removeIndex = dataList?.index(of: self.sight)
            dataList?.remove(at: removeIndex!)
        }
        //write the favorited list back to archive
        di.saveSightData(data: dataList)
        self.favoriteButton.sizeToFit()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//



    

}

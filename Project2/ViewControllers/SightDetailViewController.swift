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
    var favorite : Bool?
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
        self.favorite = sight.favorite
        self.sightStore = getFromPlist()
        
        
        check()
        favoriteButton.sizeToFit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // checks if favorited or not
    func check()
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
    }
    
    // load to DI on view disappearing
    override func viewDidDisappear(_ animated: Bool) {
        toPlist()
  

    }
    
    // loads to data interface
    func toPlist(){
        let DI : DataInterface = DataInterface(fileName: "sights")
        var store = DI.loadData() as! [Sight]
        let i = findInList(item: self.sight, arr: store)
        if i == -1
        {
            store.append(self.sight)
        }
        else{
            store[i].favorite = self.sight.favorite
        }
        DI.saveData(data: store)
    }
    
    
    // extracts information about favorites
    func getFromPlist() -> [Sight] {
        let DI : DataInterface = DataInterface(fileName: "sights")
        return DI.loadData() as! [Sight]

    }
    
    //finds if current item is in constructed array, returns index
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
    func findInList(item: Sight, arr : [Sight]) -> Int {
        var i = 0
        for sight in arr {
            if sight.name == item.name{
                return i
            }
            i = i + 1
        }
        return -1
    }
    
    
    // button function to favorite the item
    @IBAction func favoriteThis(_ sender: Any) {
        if self.favorite == true {
            self.favorite = false
        }
        else {
            self.favorite = true
        }
        
        sight.favorite = self.favorite!
        check()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//



    

}

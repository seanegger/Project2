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

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var map: MKMapView!
    var sight : Sight!
    
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
        //map.centerCoordinate = sight.placeMark.coordinate
        //image.image = sight.photo

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source





    

}

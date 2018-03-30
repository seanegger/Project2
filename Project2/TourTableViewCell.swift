//
//  TourTableViewCell.swift
//  Project2
//
//  Created by Rulev, Alec on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import UIKit
import AVKit

class TourTableViewCell : UITableViewCell{
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var tour : Tour?
    
    @IBOutlet weak var typeLabel: UILabel!
    var file : String?
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    // pull info from archives using data interface
        let di : DataInterface = DataInterface(fileName :"TourFavorites")
        if let data = di.loadTourData() as [Tour]? {
            for d in data{
                if d.name == self.tour?.name{
                    self.tour?.favorite = d.favorite
                }
            }
        }
        else
        {
            self.tour?.favorite = false
        }
        
        if (self.tour?.favorite)!
        {
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
        }
        else{
            self.favoriteButton.setTitle("Favorite", for: .normal)
        }
    }
    
    //configure button text
    func configure(file : String){
        self.file = file
        button.setTitle("Go", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //favorite button fucnctionality
    @IBAction func favorite(_ sender: Any) {
        tour?.favorite = !(tour?.favorite)!
        // get favorited sights data
        let di = DataInterface(fileName: "TourFavorites")
        var dataList = di.loadTourData()
        //if its now favorited
        if (tour?.favorite)!
        {
            self.favoriteButton.setTitle("Unfavorite", for: .normal)
            dataList?.append(self.tour!)
        }
            // if it was just unfavorited
        else
        {
            self.favoriteButton.setTitle("Favorite", for: .normal)
            
            let removeIndex = dataList?.index(of: self.tour!)
            dataList?.remove(at: removeIndex!)
        }
        //write the favorited list back to archive
        di.saveTourData(data: dataList)
        self.favoriteButton.sizeToFit()

    }
    
    
}

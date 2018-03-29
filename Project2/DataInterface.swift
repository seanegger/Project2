//
//  DataInterface.swift
//  Project2
//
//  Created by Egger, Sean on 3/29/18.
//  Copyright © 2018 Egger, Sean. All rights reserved.
//

import Foundation

class DataInterface
{
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    /*
     Finds and returns a URL for saving files to an archive
    */
    func getPath() -> String
    {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        return archiveURL.path
    }
    
    /*
     Saves data to an archive. This overload saves a note
    */
    func saveData(data: Note)
    {
        NSKeyedArchiver.archiveRootObject(data, toFile: getPath())
    }
    
    /*
     Saves data to an archive. This overload saves a list of notes
     */
    func saveData(data: [Note])
    {
        NSKeyedArchiver.archiveRootObject(data, toFile: getPath())
    }
    
    /*
     Loads data from archive. This retrieves a list of notes
    */
    func loadData() -> [Note]?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Note]
    }
    
}

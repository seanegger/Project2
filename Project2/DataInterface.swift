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
     Saves data to an archive. This overload saves a list of notes
     */
    func saveData(data: [Note])
    {
        if NSKeyedArchiver.archiveRootObject(data, toFile: getPath())
        {
            print("Data Sucesfully Saved")
        }
        else
        {
            print("RUNTIME_EXCEPTION::Data not succesfully saved")
        }
    }
    
    /*
     Saves data to an archive. This overload saves any type
     */
    func saveData(data: Any)
    {
        if NSKeyedArchiver.archiveRootObject(data, toFile: getPath())
        {
            print("Data Sucesfully Saved")
        }
        else
        {
            print("RUNTIME_EXCEPTION::Data not succesfully saved")
        }
    }
    
    /*
     Loads data from archive. This retrieves a list of notes
    */
    func loadData() -> [Note]?
    {
        let notes = NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Note]
        return notes
    }
    
    /*
     Loads data from archive. This retrieves a list of notes
     */
    func loadData() -> Any
    {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Note]
        return data
    }
    
}

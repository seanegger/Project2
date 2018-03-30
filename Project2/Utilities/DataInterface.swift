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
    
    func saveSightData(data: [Sight]?)
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
    
    func saveTourData(data: [Tour]?)
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
    func loadData() -> Any
    {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getPath())
        return data
    }
    
    /*
     Loads data from archive. This retrieves a list of notes
     */
    func loadNoteData() -> [Note]?
    {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Note]
        return data
    }
    
    func loadSightData() -> [Sight]?
    {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Sight]
        return data
    }
    
    func loadTourData() -> [Tour]?
    {
        let data = NSKeyedUnarchiver.unarchiveObject(withFile: getPath()) as? [Tour]
        return data
    }
    
}

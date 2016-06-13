//
//  DataService.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 14/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation
import UIKit

class DataService{
    static let instance = DataService()
    
    let KEY_MOVIE = "movies"
    private var _loadedMovies = [Movies]()
    
    var loadedMovies: [Movies]{
        return _loadedMovies
    }
    
    func saveMovies(){
        let moviesData = NSKeyedArchiver.archivedDataWithRootObject(_loadedMovies)
        NSUserDefaults.standardUserDefaults().setObject(moviesData, forKey: KEY_MOVIE)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadMovies(){
        if let moviesData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_MOVIE) as? NSData{
            if let moviesArray = NSKeyedUnarchiver.unarchiveObjectWithData(moviesData) as? [Movies]{
                _loadedMovies = moviesArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "moviesLoaded", object:nil))
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addMovie(movie: Movies){
        _loadedMovies.append(movie)
        saveMovies()
        loadMovies()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
    
    
}
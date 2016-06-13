//
//  Movies.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation


class Movies: NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _movieDesc: String!
    private var _url: String!
    private var _plotImdb: String!
    
    var imagePath: String{
        return _imagePath
    }
    
    var title: String{
        return _title
    }
    
    var movieDesc: String{
        return _movieDesc
    }
    
    var url: String{
        return _url
    }
    
    var plotImdb: String{
        return _plotImdb
    }
    
    init(imagePath: String, title: String, description: String, url: String, plot: String){
        self._imagePath = imagePath
        self._title = title
        self._movieDesc = description
        self._url = url
        self._plotImdb = plot
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._url = aDecoder.decodeObjectForKey("url") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._movieDesc = aDecoder.decodeObjectForKey("description") as? String
        self._plotImdb = aDecoder.decodeObjectForKey("plot") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._plotImdb, forKey: "plot")
        aCoder.encodeObject(self._movieDesc, forKey: "description")
        aCoder.encodeObject(self._url, forKey: "url")
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
    }
    
    

}
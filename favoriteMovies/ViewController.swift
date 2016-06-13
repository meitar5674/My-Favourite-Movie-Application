//
//  ViewController.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadMovies()
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onMoviesLoaded(_:)), name: "moviesLoaded", object: nil)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = DataService.instance.loadedMovies[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MoviesCell{
            cell.configureCell(movie)
            return cell
        }else{
            let cell = MoviesCell()
            cell.configureCell(movie)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 111.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedMovies.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func onMoviesLoaded(notif: AnyObject){
        tableView.reloadData()
    }
    
    
}


//
//  ViewController.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var image: UIImage!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView  = WKWebView()
        container.addSubview(webView)
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadMovies()
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onMoviesLoaded(_:)), name: "moviesLoaded", object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let urlStr = "https://www.youtube.com/watch?v=zTIfBXxgfrk"
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
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
        performSegueWithIdentifier("infoVC", sender: nil)
    }
    
    func onMoviesLoaded(notif: AnyObject){
        tableView.reloadData()
    }
    
}

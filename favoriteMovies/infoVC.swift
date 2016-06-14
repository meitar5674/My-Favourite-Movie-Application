//
//  infoVC.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 14/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit
import WebKit

class infoVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var linkToImdb: UILabel!
    @IBOutlet weak var plotByImdb: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var BackToMain: UIButton!
    @IBOutlet weak var closeUrl: UIButton!
  
    
    var movie: Movies!
    var webView =  WKWebView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        
        container.addSubview(webView)
        linkToImdb.userInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(infoVC.linkFunc))
        linkToImdb.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadPage(movie)

    }
    
    
    func loadPage(movie: Movies){
        imageView.image = DataService.instance.imageForPath(movie.imagePath)
        movieName.text = movie.title
        print(movieName.text)
        movieDescription.text = movie.movieDesc
         print(movieDescription.text)
        linkToImdb.text = movie.url
         print(linkToImdb.text)
        plotByImdb.text = movie.plotImdb
         print(plotByImdb.text)
    }
    
    func linkFunc(){
        container.hidden = false
        BackToMain.hidden = true
        closeUrl.hidden = false
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
       loadRequest(linkToImdb.text!)
        
        
    }

    @IBAction func backToMain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func closeTheWeb(sender: AnyObject) {
        view.hidden = true
        BackToMain.hidden = false
        closeUrl.hidden = true
    }
    
    func loadRequest(urlStr: String){
        let url = NSURL(string: urlStr)!
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)
    }


}

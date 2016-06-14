//
//  infoVC.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 14/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class infoVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var linkToImdb: UILabel!
    @IBOutlet weak var plotByImdb: UILabel!
    
    var movie: Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadPage(movie)
    }
    
    
    func loadPage(movie: Movies){
        movieName.text = movie.title
        movieDescription.text = movie.movieDesc
        linkToImdb.text = movie.url
        plotByImdb.text = movie.plotImdb
    }
    
    


}

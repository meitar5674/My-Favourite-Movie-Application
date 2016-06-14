//
//  MoviesCell.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 13/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = 20
        movieImg.clipsToBounds = true
        
    }
    
    func configureCell(movie: Movies){
        titleLabel.text = movie.title
        descLabel.text = movie.movieDesc
        urlLabel.text = movie.url
        movieImg.image = DataService.instance.imageForPath(movie.imagePath)
    }

}

//
//  AddMovieVC.swift
//  favoriteMovies
//
//  Created by Meitar Basson on 14/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class AddMovieVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var imdbPlotDescription: UITextField!
    @IBOutlet weak var urlField: UITextField!
    
    
    var imagePicker: UIImagePickerController!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImage.layer.cornerRadius = movieImage.frame.size.width / 2
        movieImage.clipsToBounds = true

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    
    }


    @IBAction func saveNewMovie(sender: AnyObject) {
        if let title = titleField.text, let desc = descriptionField.text , let img = movieImage.image,
            let url = urlField.text, let plot = imdbPlotDescription.text{
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            let movie = Movies(imagePath: imgPath, title: title, description: desc, url: url, plot: plot)
            DataService.instance.addMovie(movie)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImage.image = image
    }

}

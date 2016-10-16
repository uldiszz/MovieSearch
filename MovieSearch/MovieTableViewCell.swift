//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Uldis Zingis on 14/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imaveView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func updateWith(movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating)
        descriptionLabel.text = movie.description
        
        let baseURL = URL(string: "http://image.tmdb.org/t/p/w500/")
        if let imageURL = baseURL?.appendingPathComponent(movie.posterPath) {
            
            ImageController.image(forURL: imageURL) { (image) in
                self.imageView?.image = image
            }
        }
    }
}

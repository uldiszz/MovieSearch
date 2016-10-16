//
//  Movie.swift
//  MovieSearch
//
//  Created by Uldis Zingis on 14/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "original_title"
    private let kRating = "vote_average"
    private let kDescription = "overview"
    private let kPosterPath = "poster_path"
    
    let title: String
    let rating: Double
    let description: String
    let posterPath: String
    
    init(title: String, rating: Double, description: String, posterPath: String) {
        self.title = title
        self.rating = rating
        self.posterPath = posterPath
        self.description = description
    }
    
    init?(json: [String: Any]) {
        guard let title = json[kTitle] as? String,
            let rating = json[kRating] as? Double,
            let posterPath = json[kPosterPath] as? String,
            let description = json[kDescription] as? String else { return nil }
        self.title = title
        self.rating = rating
        self.posterPath = posterPath
        self.description = description
    }
}

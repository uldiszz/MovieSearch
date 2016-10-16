//
//  MovieController.swift
//  MovieSearch
//
//  Created by Uldis Zingis on 14/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    
    static func searchMovies(query: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = baseURL else { completion([]); return }
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: ["api_key" : "9f1e3a1c41fc3333375fa5ef0f267495", "language": "en-US", "query": query]) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("No data were received.")
                completion([])
                return
            }

            guard let returnedDict = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let moviesDict = returnedDict["results"] as? [[String: Any]] else { NSLog("Could not parse json. \n Response: \(response)"); completion([]); return }
            
            let movies = moviesDict.flatMap { Movie(json: $0) }
            
            completion(movies)
        }
    }
}

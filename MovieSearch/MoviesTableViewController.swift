//
//  MoviesTableViewController.swift
//  MovieSearch
//
//  Created by Uldis Zingis on 14/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchTextField: UISearchBar!
   
    var movies: [Movie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }

        cell.updateWith(movie: movies[indexPath.row])
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchTextField.text else { return }
        searchTextField.resignFirstResponder()
        DispatchQueue.main.async {
            MovieController.searchMovies(query: query) { (movies) in
                self.movies = movies
            }
        }
    }
}

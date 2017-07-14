//
//  MovieService.swift
//  move_json
//
//  Created by Marquavious on 7/14/17.
//  Copyright © 2017 Marquavious Draggon. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct MovieService {
    
    // This function grabs the movie objects from the API and completes
    // With an array of Created Movie Objects
    static func getMovies(completion: @escaping ([Movie]) -> ()){
        var arrayOfMovies: [Movie] = [] // Temp Array
        
        // Use Alamofire to hit the api and it returns a response in JSON format
        Alamofire.request(Constants.itunesUrl).responseJSON { (response) in
            
            // Cast the response into a SwiftyJSON Object
            var json = JSON(response.data as Any)
            
            // Goes to the feed branch, then the entry branch
            let feed = json["feed"]["entry"].arrayValue
            
            // Iterats through objects in feed
            for movie in feed{
                let newMovie = Movie(movie) // Creates new movie
                arrayOfMovies.append(newMovie) // Adds movie to the array
            }
            completion(arrayOfMovies) // Completion completes with the arrayOfMovies
        }
    }
}

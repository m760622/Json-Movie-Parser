//
//  Movie.swift
//  move_json
//
//  Created by Marquavious on 7/14/17.
//  Copyright © 2017 Marquavious Draggon. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    var title: String
    var author: String
    
    // The int takes in JSON and parses it for us
    // After that, it sets the values for us
    init(_ json: JSON){
        self.title = json["title"]["label"].stringValue
        self.author = json["im:artist"]["label"].stringValue
    }
}

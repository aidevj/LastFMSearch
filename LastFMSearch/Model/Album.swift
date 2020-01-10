//
//  Album.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// Handles structs for Albums decodable class from JSON API call

import Foundation

// Parsed from {} results
struct AlbumResults: Decodable {
    let albumResults: AlbumMatches
    
    private enum CodingKeys: String, CodingKey {
        case albumResults = "results"
    }
}

// Pared from {} albummatches
struct AlbumMatches: Decodable {
    let albumMatches: Albums
    
    private enum CodingKeys: String, CodingKey {
        case albumMatches = "albummatches"
    }
}

// Parsed from [] album
struct Albums: Decodable {
    let albums: [Album]
    
    private enum CodingKeys: String, CodingKey {
        case albums = "album"
    }
}

class Album: Decodable {
    
    let name: String
    let artist: String  // maybe use class Artist instead???
    let url: String
    let image: [Image]
    let mbid: String    //! ID assigned by Last FM
}


// PUBLIC, USE ACROSS MODEL
struct Image: Decodable {
    
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case url = "#text"
    }
}

//
//  Artist.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// Artist class

import Foundation

// Parsed from {} results
struct ArtistResults: Decodable {
    let artistResults: ArtistMatches
    
    private enum CodingKeys: String, CodingKey {
        case artistResults = "results"
    }
}

// Parsed from {} artistmatches
struct ArtistMatches: Decodable {
    let artistMatches: Artists
    
    private enum CodingKeys: String, CodingKey {
        case artistMatches = "artistmatches"
    }
}

// Parsed from [] artist
struct Artists: Decodable {
    let artists: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case artists = "artist"
    }
}

class Artist: Decodable {
    
    let name: String
    let url: String
    let image: [Image]
    let mbid: String    // ID Assigned by Last FM
}


// PUBLIC, USE ACROSS MODEL
struct Image: Decodable {
    
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case url = "#text"
    }
}

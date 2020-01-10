//
//  Track.swift
//  LastFMSearch
//
//  Created by Consultant on 1/9/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// Track class

import Foundation

// Parsed from {} results
struct TrackResults: Decodable {
    let trackResults: TrackMatches
    
    private enum CodingKeys: String, CodingKey {
        case trackResults = "results"
    }
}

// Parsed from {} trackmatches
struct TrackMatches: Decodable {
    let trackMatches: Tracks
    
    private enum CodingKeys: String, CodingKey {
        case trackMatches = "trackmatches"
    }
}

// Parsed from [] track
struct Tracks: Decodable {
    let tracks: [Track]
    
    private enum CodingKeys: String, CodingKey {
        case tracks = "track"
    }
}

class Track: Decodable {
    
    let name: String
    let artist: String
    let url: String
    let image: [Image]
    let mbid: String    // ID assigned by Last FM
}

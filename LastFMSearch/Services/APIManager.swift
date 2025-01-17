//
//  APIManager.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// Handles getting API call from Last FM API

import Foundation

struct APIManager {
    

     //Example JSON URL:
     //http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=YOUR_API_KEY&format=json

    
    //MARK: - Properties
    
    let key = apiKey
    let root = "https://ws.audioscrobbler.com/2.0/?method="
    let searchAlbum = "album.search&album="
    let searchArtist = "artist.search&artist="
    let searchTrack = "track.search&track="
    let apiLookup = "&api_key="
    let format = "&format=json"
    
    var search: String!     // user's search query
    
    //MARK: - Initializer
    
    init(_ search: String? = nil) {
        self.search = search
    }
    
    // MARK: - URLS
    
    var albumsUrl: URL? {
        return URL(string: root + searchAlbum + search + apiLookup + key + format)
    }
    
    var artistsUrl: URL? {
        return URL(string: root + searchArtist + search + apiLookup + key + format)
    }
    
    var tracksUrl: URL? {
        return URL(string: root + searchTrack + search + apiLookup + key + format)
    }
}

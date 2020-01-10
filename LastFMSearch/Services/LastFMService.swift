//
//  LastFMService.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// Singleton to get the Last FM Service calls

import Foundation

// Custom enum errors for Last FM
enum LastFMError: Error {
    case badURL(String)
    case badDataTask(String)
    case badDecoder(String)
}

// Type aliases
//typealias AlbumHandler = (<[Track]>, LastFMError) -> Void

let LastFM = LastFMService.shared

final class LastFMService {
    
    static let shared = LastFMService()
    private init() {}
    
  
}

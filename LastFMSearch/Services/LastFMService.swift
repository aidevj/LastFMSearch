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
typealias AlbumHandler = (Result<[Album], LastFMError>) -> Void
typealias ArtistHandler = (Result<[Artist], LastFMError>) -> Void
typealias TrackHandler = (Result<[Track], LastFMError>) -> Void

let LastFM = LastFMService.shared

final class LastFMService {
    
    static let shared = LastFMService()
    private init() {}
    
    //MARK: - Get Album URL Session
    func getAlbum(for search: String, completion: @escaping AlbumHandler) {
        guard let url = APIManager(search).albumsUrl else {
            completion(.failure(.badURL("Couldn't create Album URL")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                completion(.failure(.badDataTask(error.localizedDescription)))
                return
            }
            
            if let data = dat {
                do {
                    let response = try JSONDecoder().decode(AlbumResults.self, from: data)
                    let albums = response.albumResults.albumMatches.albums
                    completion(.success(albums))
                } catch {
                    completion(.failure(.badDataTask(error.localizedDescription)))
                    return
                }
            }
        }.resume()
    } // END getAlbum func
  
    //MARK: - Get Artists URL Session
    
    func getArtist(for search: String, completion: @escaping ArtistHandler) {
        guard let url = APIManager(search).artistsUrl else {
            completion(.failure(.badURL("Couldn't create Artist URL")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                completion(.failure(.badDataTask(error.localizedDescription)))
                return
            }
            
            if let data = dat {
                do {
                    let response = try JSONDecoder().decode(ArtistResults.self, from: data)
                    let artists = response.artistResults.artistMatches.artists
                    completion(.success(artists))
                } catch {
                    completion(.failure(.badDataTask(error.localizedDescription)))
                    return
                }
            }
        }.resume()
    } // END getArtist func
    
    
    //MARK: - Get Tracks URL Session
    
    //TODO
}

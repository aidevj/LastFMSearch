//
//  ViewModel.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//
// View Model class for MVVM architecture

import Foundation

protocol ViewModelDelegate: class {
    func update()
}

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    var albums = [Album]() {
        didSet {
            delegate?.update()
        }
    }
    
    var artists = [Artist]() {
        didSet {
            delegate?.update()
        }
    }
    
    var tracks = [Track]() {
        didSet {
            delegate?.update()
        }
    }
    
    var currentAlbum: Album! {
        didSet {
            tracks = []
        }
    }
}

extension ViewModel {
    func getAlbums(_ search: String) {
        
        LastFM.getAlbum(for: search) { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albums = albums
                print("Album count: \(albums.count)")
            case .failure(let error):
                print("Last FM error (Albums): \(error.localizedDescription)")
            }
        }
    }
    
    func getArtists(_ search: String) {
        
        LastFM.getArtist(for: search) { [weak self] result in
             switch result {
             case .success(let artists):
                self?.artists = artists
                print("Artist count: \(artists.count)")
             case .failure(let error):
                print("Last FM error (Artists): \(error.localizedDescription)")
            }
        }
    }
    
    func getTracks(_ search: String) {
        
        LastFM.getTrack(for: search) { [weak self] result in
            switch result {
            case .success(let tracks):
                self?.tracks = tracks
                print("Track count: \(tracks.count)")
            case .failure(let error):
                print("Last FM error (Tracks): \(error.localizedDescription)")
            }
        }
    }
    

}

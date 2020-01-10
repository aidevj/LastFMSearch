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

//TODO: Track, album, and artist delegates?

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    var albums = [Album]() {
        didSet {
            delegate?.update()
        }
    }
    
    //TODO: songs var and currentAlbum, currentSong, currentArtist
}

extension ViewModel {
    func get (_ albumName: String) {
        //TODO
    }
}

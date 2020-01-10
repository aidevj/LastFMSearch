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
                print("Last FM error: \(error.localizedDescription)")       // THIS IS HAPPENING
            }
        }
    }
    
    func getTracks(for id: Int) {
        //LastFM.getTracks
    }
}

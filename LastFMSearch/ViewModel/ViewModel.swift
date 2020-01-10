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
}

extension ViewModel {
    func get (_ albumName: String) {
        //TODO
    }
}

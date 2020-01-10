//
//  ArtistTableCell.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ArtistTableCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numAlbumsLabel: UILabel!    // number of albums associated with artist
    
    static let identifier = "ArtistTableCell"
    
    var artist: Artist! {
        didSet {
            nameLabel.text = artist.name
            //numAlbumsLabel.text = artist.
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}

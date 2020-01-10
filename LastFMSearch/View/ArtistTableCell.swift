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
    @IBOutlet weak var albumsLabel: UILabel!    // number of albums associated with artist
    
    static let identifier = "ArtistTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}

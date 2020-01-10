//
//  AlbumTableCell.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class AlbumTableCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var tracksLabel: UILabel!
    
    static let identifier = "AlbumTableCell"
    
    //var album = Album!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

//
//  TrackTableCell.swift
//  LastFMSearch
//
//  Created by Consultant on 1/8/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class TrackTableCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    static let identifier = "TrackTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

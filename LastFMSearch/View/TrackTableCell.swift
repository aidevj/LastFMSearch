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
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    static let identifier = "TrackTableCell"
    
    var track: Track! {
        didSet {
            nameLabel.text = track.name
            artistLabel.text = track.artist
            guard let trackImageUrl = URL(string: track.image[0].url) else { return }

            trackImageUrl.getImage { [ weak self ] img in
                if let image = img {
                    self?.trackImageView.image = image
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

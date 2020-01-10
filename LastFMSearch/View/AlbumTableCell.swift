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
    
    // Setting values for display here
    var album: Album! {
        didSet {
            titleLabel.text = album.name
            artistLabel.text = album.artist
            //tracksLabel.text = "\()"
//            guard let albumImageUrl = URL(string: album.image.url) else { return }
//
//            albumImageUrl.getImage { [ weak self ] img in
//                if let image = img {
//                    self?.albumImageView.image = image
//                }
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

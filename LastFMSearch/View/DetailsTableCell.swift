//
//  DetailsTableCell.swift
//  LastFMSearch
//
//  Created by Consultant on 1/10/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class DetailsTableCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailLink: UILabel!
    
    static let identifier = "DetailsTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}

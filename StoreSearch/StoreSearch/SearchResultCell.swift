//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Valiant on 2020/5/20.
//  Copyright © 2020 Valiant. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

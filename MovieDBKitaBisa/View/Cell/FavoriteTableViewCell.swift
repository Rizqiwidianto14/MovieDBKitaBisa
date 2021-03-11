//
//  FavoriteTableViewCell.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



//
//  Movie.swift
//  MovieDB
//
//  Created by Cristian Torres on 1/31/19.
//  Copyright © 2019 Uesebe. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var popularLbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  CustomCell.swift
//  PhotoApplecationMVVM
//
//  Created by Rufan Abdurahmanov on 21.10.21.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

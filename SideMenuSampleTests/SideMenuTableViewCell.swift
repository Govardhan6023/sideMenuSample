//
//  SideMenuTableViewCell.swift
//  Spectrocarer
//
//  Created by Renuka on 01/10/19.
//  Copyright © 2019 Vedas. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var settingsImage: UIImageView!
   
    @IBOutlet weak var sideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

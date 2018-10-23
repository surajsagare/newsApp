//
//  CategoryCell.swift
//  POC2
//
//  Created by Suraj Sagare on 18/09/18.
//  Copyright © 2018 Suraj Sagare. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var byLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

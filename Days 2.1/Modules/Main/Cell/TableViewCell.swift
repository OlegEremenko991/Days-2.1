//
//  TableViewCell.swift
//  Days 2.1
//
//  Created by Олег Еременко on 28.06.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell {

// MARK: Public properties
    
    static let cellID = "Cell"
    
// MARK: IBOutlets
    
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var itemDaysLabel: UILabel!
    
// MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
// MARK: Public methods
    
    func setupCell(itemName: String, itemDays: String) {
        itemNameLabel.text = itemName
        itemDaysLabel.text = itemDays
    }

}
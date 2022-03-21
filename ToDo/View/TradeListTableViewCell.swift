//
//  TradeListTableViewCell.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit

class TradeListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(data: TradeModel) {
        self.nameLabel.text = data.name
        self.priceLabel.text = "\(data.price)"
        self.quantityLabel.text = "\(data.quantity)"
    }
    
}

//
//  CallListTableViewCell.swift
//  ToDo
//
//  Created by Dev on 3/20/22.
//

import UIKit

class CallListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(data: CallModel) {
        self.numberLabel.text = data.number
        self.nameLabel.text = data.name
    }
    
}

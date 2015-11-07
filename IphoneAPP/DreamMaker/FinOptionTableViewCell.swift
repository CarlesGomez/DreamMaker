//
//  FinOptionTableViewCell.swift
//

import UIKit

class FinOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var finOptionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(title: String)
    {
        self.finOptionTitle.text = title
    }

}

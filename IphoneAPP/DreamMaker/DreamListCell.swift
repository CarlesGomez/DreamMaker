//
//  DreamListCell.swift
//

import UIKit

class DreamListCell: UITableViewCell {

    /*REGION IBOUTLETS*/
    @IBOutlet weak var imgDream: UIImageView!
    @IBOutlet weak var lblDream: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    /*ENDREGION IBOUTLETS*/
    
    /*REGION VARIABLES*/
    var gradientSetted: Bool = false
    /*ENDREGION VARIABLES*/
    
    /*REGION EVENTS*/
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (!gradientSetted)
        {
            let gradient = CAGradientLayer().generate(Color.Black, vertical: false)
            
            gradient.frame = self.imgDream.bounds
            imgDream.layer.insertSublayer(gradient, atIndex: 1)
            
            self.gradientSetted = true
        }
        
    }
    /*ENDREGION EVENTS*/
    
    /*REGION MÈTODES*/
    func setListDream(dream: Dream)
    {
        self.imgDream.image = UIImage(named: dream.imagePath)
        self.lblDream.text = dream.title
        self.lblPrice.text = String(dream.price)
    }
    /*ENDREGION MÈTODES*/

}

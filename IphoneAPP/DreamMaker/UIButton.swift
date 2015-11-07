//
//  UIButton+DreamMaker.swift
//

import Foundation
import UIKit

//extension of UIButton as icons
extension UIButton {
    
    /*REGION METODES*/
    class func back() -> UIButton {
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(0.0, 0.0, 26.0, 26.0)
        button.setImage(UIImage(named: "ic_back"), forState: UIControlState.Normal)
        button.tintColor = UIColor.whiteColor()
        return button
    }
    /*ENDREGION METODES*/
    
}
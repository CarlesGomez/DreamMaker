//
//  gradient.swift
//

import Foundation
import UIKit


enum Color {
    case Brown, Black, WantyBackground, NotificationBlack
}

/*Extension that represents a gradient layer*/
extension CAGradientLayer {
    
    /*REGION METODES*/
    
    /**
    
    function that generates a gradient layer.
    
    :param: color enum to generate the gradient based on the color.
    
    :param: vertical Bool to generate the gradient with horizontal or vertical orientation.
    :returns: CAGradientLayer.
    
    **/
    func generate(color: Color, vertical: Bool) -> CAGradientLayer {
        
        var topColor = UIColor()
        var midColor = UIColor()
        var bottomColor = UIColor()
        var gradientLocations: Array <NSNumber> = []
        
        switch color {
        case .Black:
            topColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 0.0)
            midColor = UIColor(red: 5/255, green: 5/255, blue: 5/255, alpha: 0.4)
            bottomColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
            gradientLocations = [0.6, 0.7, 1.0]
        default:
            topColor = UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 0.0)
            midColor = UIColor(red: 5/255, green: 5/255, blue: 5/255, alpha: 0.4)
            bottomColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
            gradientLocations = [0.6, 0.8, 1.0]
        }
        
        let gradientColors: Array <AnyObject> = [topColor.CGColor, midColor.CGColor, bottomColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        if (vertical)
        {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        
        return gradientLayer
    }
    /*ENDREGION METODES*/
}
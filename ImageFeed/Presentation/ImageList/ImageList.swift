//
//  ImageList.swift
//  ImageFeed
//
//  Created by Даниил Азевич on 16/10/2024.
//

import Foundation
import UIKit


class ImageListCell : UITableViewCell {
    
    private var hasGradient = false
    
    @IBOutlet private var labelWrapperView: UIView!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var labelView: UILabel!
    
    static let reuseIdentifier = "ImageListCell"
    
    func setGradient() {
        if(hasGradient) {
            return
        }
        
        labelWrapperView.layer.cornerRadius = 16
        labelWrapperView.layer.masksToBounds = true
        labelWrapperView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        let gradientLayer = CAGradientLayer()
        let gradientColor = UIColor(named: "YP Black") ?? UIColor.black
        gradientLayer.frame = labelWrapperView.bounds
        gradientLayer.colors = [gradientColor.withAlphaComponent(0.0).cgColor, gradientColor.withAlphaComponent(0.2).cgColor]
        gradientLayer.shouldRasterize = true
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        labelWrapperView.layer.insertSublayer(gradientLayer, at: 0)
        hasGradient = true
    }
}

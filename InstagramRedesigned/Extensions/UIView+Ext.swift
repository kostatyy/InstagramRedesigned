//
//  UIView+Ext.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

enum Edge {
    case top
    case bottom
    case left
    case right
}

extension UIView {
    // Pinning To Edges With Constraints
    func pinToEdges(edges: [Edge] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
        guard let superview = superview else {return}
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            }
        }
    }
    
    // Adding Rounded Corners
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    // Setting Up Bottom Inner Shadow
    func drawBottomShadow(for view: UIView, shadowRad: CGFloat, color: UIColor) {
        let size = view.frame.size
        let innerShadowLayer: CALayer = CALayer()
        
        // Need to set a backgroundColor or it doesn't work
        innerShadowLayer.backgroundColor = UIColor.black.cgColor

        innerShadowLayer.position = CGPoint(x: size.width / 2, y: size.height + (size.height / 2))
        innerShadowLayer.bounds = CGRect(x: 0, y: 0, width: size.width * 2, height: size.height)
        
        innerShadowLayer.shadowColor = color.cgColor
        innerShadowLayer.shadowOffset = CGSize(width: 0, height: -(shadowRad * 1.5))
        innerShadowLayer.shadowOpacity = 0.65
        innerShadowLayer.shadowRadius = shadowRad

        view.layer.addSublayer(innerShadowLayer)
    }
    
    func addBlurEffect(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}

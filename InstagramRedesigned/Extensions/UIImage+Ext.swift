//
//  UIImage+Ext.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

extension UIImage {
    func setColor(color: UIColor) -> UIImage {
        return self.withRenderingMode(.alwaysOriginal).withTintColor(color)
    }
}

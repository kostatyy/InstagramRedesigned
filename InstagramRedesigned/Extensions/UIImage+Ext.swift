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
    
    func maskWithGradientColor(gradientColors: [CGColor]) -> UIImage? {
        let maskImage = self.cgImage
        let width = self.size.width
        let height = self.size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let bitmapContext = CGContext(data: nil,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: bitmapInfo.rawValue)
        
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = gradientColors as CFArray
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
        let startPoint = CGPoint(x: width/2, y: 0)
        let endPoint = CGPoint(x: width/2, y: height)
        
        bitmapContext!.clip(to: bounds, mask: maskImage!)
        bitmapContext!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        if let cImage = bitmapContext!.makeImage() {
            let coloredImage = UIImage(cgImage: cImage)
            return coloredImage
        }
        else  {
            return nil
        }
    }
    
    func addImagePadding(x: CGFloat, y: CGFloat) -> UIImage? {
        let width: CGFloat = size.width + x
        let height: CGFloat = size.height + y
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        let origin: CGPoint = CGPoint(x: (width - size.width) / 2, y: (height - size.height) / 2)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithPadding
    }
}

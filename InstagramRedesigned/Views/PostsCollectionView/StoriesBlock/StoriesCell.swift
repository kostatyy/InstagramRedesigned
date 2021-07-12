//
//  StoriesCell.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 12.07.2021.
//

import UIKit

class StoriesCell: UICollectionViewCell {
    
    // Static Vars
    static let reuseId = "StoriesCellId"
    
    /* Views */
    var userImage = UIImageView()
    var userName = UILabel()
    let containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
    var myStory = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print(myStory)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.frame = contentView.bounds
        containerView.frame.size = CGSize(width: containerView.frame.size.height * 1, height: containerView.frame.size.height * 1)
        userImage.frame = containerView.bounds
        userImage.frame.size = CGSize(width: containerView.bounds.width - 12, height: containerView.bounds.width - 12)
        userImage.center = containerView.center
        userName.frame = CGRect(x: 0, y: contentView.frame.maxY + 5, width: contentView.bounds.width, height: 20)
        userName.center.x = containerView.center.x
        setupCircles()
    }
    
    private func setupViews() {
        userImage.backgroundColor = .gray
        if !myStory { userImage.image = UIImage(named: "user_image") }
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.isUserInteractionEnabled = true
        
        userName.text = "kostatyy"
        userName.textColor = .black
        
        contentView.addSubview(containerView)
        containerView.addSubview(userImage)
        contentView.addSubview(userName)
    }
    
    private func setupCircles() {
        let containerHeight = containerView.bounds.height.rounded(.down)
        let profilePictureHeight = userImage.bounds.height.rounded(.down)
        containerView.setGradientStack(colorTop: UIColor.red.cgColor, colorBottom: UIColor.orange.cgColor, cornerRadius: containerHeight / 2, startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 0.0))
        userImage.layer.cornerRadius = profilePictureHeight / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

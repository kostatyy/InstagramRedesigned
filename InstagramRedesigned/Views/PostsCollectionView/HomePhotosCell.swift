//
//  HomePhotosCell.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

class HomePhotosCell: UICollectionViewCell {
    
    // Static Vars
    static let reuseId = "PhotosCellId"
    static let curveCornerRadius: CGFloat = 35
    
    /* Views */
    var bgImage = UIImageView()
    var userImage = UIImageView()
    var userName = UILabel()
    var likeStroke = UIImageView()
    var likeFill = UIImageView()
    
    // Likes Block
    var likesStack = UIView()
    var likesIcon = UIImageView()
    var likesCount = UILabel()
    // Comments Block
    var commentsStack = UIView()
    var commentsIcon = UIImageView()
    var commentsCount = UILabel()
    
    var sendIcon = UIImageView()
    var saveIcon = UIImageView()
    
    // Computed Vars
    private let userImageHeightMult: CGFloat = 0.1
    private let stacksSpacing: CGFloat = 12
    private let imagesSizeMultipler: CGFloat = 0.07
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        roundCorners([.topLeft, .topRight], radius: HomePhotosCell.curveCornerRadius)

        setupViews()
        setupLayouts()
    }
    
    // Drawing Bottom Inner Shadow
    override func draw(_ rect: CGRect) {
        drawBottomShadow(for: bgImage, shadowRad: HomePhotosCell.curveCornerRadius, color: .black)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImage.layer.cornerRadius = frame.height * userImageHeightMult / 2
    }
    
    private func setupViews() {
        bgImage.image = UIImage(named: "photo")
        bgImage.contentMode = .scaleAspectFill
        
        userImage.clipsToBounds = true
        userImage.image = UIImage(named: "user_image")
        userImage.contentMode = .scaleAspectFill
        
        userName.text = "kostatyy"
        userName.textColor = .white
        
        likesStack.addBlurEffect(style: .regular)
        likesStack.layer.masksToBounds = true
        likesStack.layer.cornerRadius = 25
        
        likesIcon.image = UIImage(named: "like_fill")
        commentsIcon.image = UIImage(systemName: "message.fill")?.setColor(color: .white)
        sendIcon.image = UIImage(systemName: "paperplane.fill")?.setColor(color: .white)
        saveIcon.image = UIImage(systemName: "bookmark")?.setColor(color: .white)
        likeStroke.image = UIImage(named: "like_stroke")
        likeFill.image = UIImage(named: "like_fill")?.maskWithGradientColor(gradientColors: [UIColor.orange.cgColor, UIColor.purple.cgColor])
        
        likesCount.text = "7,8k"
        commentsCount.text = "178"
        
        [likesCount, commentsCount].forEach {
            $0.textColor = .white
        }
        
        [bgImage, userImage, userName, likesStack, likesIcon, commentsStack, commentsIcon, sendIcon, saveIcon, likesCount, commentsCount, likeStroke, likeFill].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayouts() {
        contentView.addSubview(bgImage)
        contentView.addSubview(userImage)
        contentView.addSubview(userName)
        contentView.addSubview(likesStack)
        contentView.addSubview(commentsStack)
        contentView.addSubview(sendIcon)
        contentView.addSubview(saveIcon)
        contentView.addSubview(likeStroke)
        likeStroke.addSubview(likeFill)
        
        likesStack.addSubview(likesIcon)
        likesStack.addSubview(likesCount)
        
        commentsStack.addSubview(commentsIcon)
        commentsStack.addSubview(commentsCount)
        
        likesIcon.pinToEdges(edges: [.left, .top, .bottom], constant: stacksSpacing)
        likesCount.pinToEdges(edges: [.right, .top, .bottom], constant: stacksSpacing)
        
        commentsIcon.pinToEdges(edges: [.left, .top, .bottom], constant: stacksSpacing)
        commentsCount.pinToEdges(edges: [.right, .top, .bottom], constant: stacksSpacing)
        
        bgImage.pinToEdges()
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            userImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: userImageHeightMult),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            
            userName.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            userName.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 10),
            
            likesStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(HomePhotosCell.curveCornerRadius + 15)),
            likesStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            likesStack.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: 0.1),
            likesCount.leftAnchor.constraint(equalTo: likesIcon.rightAnchor, constant: 10),
            likesIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: imagesSizeMultipler),
            likesIcon.heightAnchor.constraint(equalTo: likesIcon.widthAnchor),
            
            commentsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(HomePhotosCell.curveCornerRadius + 15)),
            commentsStack.leftAnchor.constraint(equalTo: likesCount.rightAnchor, constant: stacksSpacing),
            commentsStack.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: 0.1),
            commentsCount.leftAnchor.constraint(equalTo: commentsIcon.rightAnchor, constant: 10),
            commentsIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: imagesSizeMultipler),
            commentsIcon.heightAnchor.constraint(equalTo: commentsIcon.widthAnchor),
            
            sendIcon.leftAnchor.constraint(equalTo: commentsStack.rightAnchor, constant: stacksSpacing),
            sendIcon.centerYAnchor.constraint(equalTo: commentsStack.centerYAnchor),
            sendIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: imagesSizeMultipler),
            sendIcon.heightAnchor.constraint(equalTo: sendIcon.widthAnchor),
            
            saveIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            saveIcon.centerYAnchor.constraint(equalTo: commentsStack.centerYAnchor),
            saveIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: imagesSizeMultipler),
            saveIcon.heightAnchor.constraint(equalTo: saveIcon.widthAnchor),
            
            likeStroke.centerXAnchor.constraint(equalTo: centerXAnchor),
            likeStroke.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeStroke.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            likeStroke.heightAnchor.constraint(equalTo: likeStroke.widthAnchor),
            
            likeFill.centerXAnchor.constraint(equalTo: likeStroke.centerXAnchor),
            likeFill.centerYAnchor.constraint(equalTo: likeStroke.centerYAnchor),
            likeFill.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            likeFill.heightAnchor.constraint(equalTo: likeFill.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

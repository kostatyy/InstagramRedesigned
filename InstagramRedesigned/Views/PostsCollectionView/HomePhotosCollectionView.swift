//
//  HomePhotosCollectionView.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

class HomePhotosCollectionView: UICollectionView {
    
    private var photos = [UIImage(named: "photo"), UIImage(named: "photo1"), UIImage(named: "photo"), UIImage(named: "photo1")]
    
    init(layout: UICollectionViewLayout) {

        super.init(frame: .zero, collectionViewLayout: layout)
                
        configure()        
    }
    
    private func configure() {
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
        
        dataSource = self
        delegate = self
        
        register(HomePhotosCell.self, forCellWithReuseIdentifier: HomePhotosCell.reuseId)
        register(StoriesCell.self, forCellWithReuseIdentifier: StoriesCell.reuseId)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomePhotosCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return photos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = dequeueReusableCell(withReuseIdentifier: StoriesCell.reuseId, for: indexPath) as! StoriesCell
            if indexPath.row == 0 {
                cell.myStory = true
            }
            return cell
        } else {
            let cell = dequeueReusableCell(withReuseIdentifier: HomePhotosCell.reuseId, for: indexPath) as! HomePhotosCell
            cell.layer.zPosition = CGFloat(indexPath.row)
            cell.bgImage.image = photos[indexPath.row]
            return cell
        }
    }
}


extension HomePhotosCollectionView {
    func setCellMask() {
        let path = UIBezierPath()
        
        // Top Left Corner
        path.move(to: CGPoint(x: 0, y: HomePhotosCell.curveCornerRadius))
        path.addArc(withCenter: CGPoint(x: HomePhotosCell.curveCornerRadius, y: HomePhotosCell.curveCornerRadius),
                    radius: HomePhotosCell.curveCornerRadius,
                    startAngle: .pi / 2,
                    endAngle: -.pi / 2,
                    clockwise: true)

        // Top Right Corner
        path.addLine(to: CGPoint(x: frame.width - HomePhotosCell.curveCornerRadius, y: 0))
        path.addArc(withCenter: CGPoint(x: frame.width - HomePhotosCell.curveCornerRadius, y: HomePhotosCell.curveCornerRadius),
                    radius: HomePhotosCell.curveCornerRadius,
                    startAngle: -.pi / 2,
                    endAngle: 0,
                    clockwise: true)
        
        
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


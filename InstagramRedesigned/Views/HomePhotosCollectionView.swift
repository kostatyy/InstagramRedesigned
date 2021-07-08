//
//  HomePhotosCollectionView.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

class HomePhotosCollectionView: UICollectionView {
    
    init(layout: UICollectionViewLayout) {

        super.init(frame: .zero, collectionViewLayout: layout)
                
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        roundCorners([.topLeft, .topRight], radius: HomePhotosCell.curveCornerRadius)
    }
    
    private func configure() {
        showsVerticalScrollIndicator = false
        backgroundColor = .clear
        
        dataSource = self
        register(HomePhotosCell.self, forCellWithReuseIdentifier: HomePhotosCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomePhotosCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: HomePhotosCell.reuseId, for: indexPath) as! HomePhotosCell
        cell.layer.zPosition = CGFloat(indexPath.row)
        return cell
    }
}

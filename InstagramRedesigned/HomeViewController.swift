//
//  HomeViewController.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var photosCollectionView: HomePhotosCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear")?.setColor(color: .lightGray), style: .plain, target: self, action: nil)
        title = "Instagram"
        
        setupCollectionView()
    }

    private func setupCollectionView() {
        photosCollectionView = HomePhotosCollectionView(layout: createCompostionalLayout())
        photosCollectionView.contentInset = UIEdgeInsets(top: HomePhotosCell.curveCornerRadius, left: 0, bottom: 0, right: 0)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(photosCollectionView)
        
        NSLayoutConstraint.activate([
            photosCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photosCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75)
        ])
    }

}

//MARK: - Custom Collection View Layout (CompositionalLayout)
extension HomeViewController {
    func createCompostionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnv) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: -(HomePhotosCell.curveCornerRadius), leading: 0, bottom: 0, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.7))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            return section
        }

        return layout
    }
}

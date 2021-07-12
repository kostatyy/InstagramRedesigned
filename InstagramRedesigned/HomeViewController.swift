//
//  HomeViewController.swift
//  InstagramRedesigned
//
//  Created by Macbook Pro on 07.07.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var photosContainer = UIView()
    private var photosCollectionView: HomePhotosCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear")?.setColor(color: .lightGray), style: .plain, target: self, action: nil)
        title = "Instagram"
        
        setupPhotosCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        photosContainer.roundCorners([.topLeft, .topRight], radius: HomePhotosCell.curveCornerRadius)
    }

    private func setupPhotosCollectionView() {
        photosCollectionView = HomePhotosCollectionView(layout: createCompostionalLayout())
//        photosCollectionView.contentInset = UIEdgeInsets(top: view.frame.height * 0.15, left: 0, bottom: 0, right: 0)
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photosContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(photosContainer)
        photosContainer.addSubview(photosCollectionView)
        
        photosCollectionView.pinToEdges()
        
        NSLayoutConstraint.activate([
            photosContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            photosContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photosContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

}

//MARK: - Custom Collection View Layout (CompositionalLayout)
extension HomeViewController: UICollectionViewDelegate {
    func createCompostionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnv) -> NSCollectionLayoutSection? in
            
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.22), heightDimension: .fractionalWidth(0.22))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 15)


                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: HomePhotosCell.curveCornerRadius, bottom: HomePhotosCell.curveCornerRadius * 2.5, trailing: HomePhotosCell.curveCornerRadius)

                section.orthogonalScrollingBehavior = .continuous
                return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: -(HomePhotosCell.curveCornerRadius), leading: 0, bottom: 0, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.55))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                return section
            }
            
        }

        return layout
    }
}

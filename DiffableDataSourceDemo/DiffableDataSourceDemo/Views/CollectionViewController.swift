//
//  CollectionViewController.swift
//  DiffableDataSourceDemo
//
//  Created by RYAN GREENBURG on 9/30/20.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<ColorController.SortedSection, Color>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: SectionHeaderCollectionReusableView.nibID, bundle: nil), forSupplementaryViewOfKind: SectionHeaderCollectionReusableView.nibID, withReuseIdentifier: "HeaderCell")
        dataSource = constructCollectionViewDataSource()
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = configureCollectionViewLayot()
        applyData()
    }

    private func constructCollectionViewDataSource() -> UICollectionViewDiffableDataSource<ColorController.SortedSection, Color> {
        let dataSource = UICollectionViewDiffableDataSource<ColorController.SortedSection, Color>(collectionView: collectionView) { (collectionView, indexPath, color) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
            cell.backgroundColor = color.shade
            return cell
        }
        
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath)
            -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: "HeaderCell",
                    for: indexPath) as? SectionHeaderCollectionReusableView else {
                fatalError("Cannot create header view")
            }
            supplementaryView.headerLabel.text = ColorController.SortedSection.allCases[indexPath.section].sectionTitle
            
            return supplementaryView
        }
        
        return dataSource
    }
    
    func applyData() {
        var snapshot = NSDiffableDataSourceSnapshot<ColorController.SortedSection, Color>()
        snapshot.appendSections(ColorController.SortedSection.allCases)
        snapshot.sectionIdentifiers.forEach { section in
            switch section {
            case .cool:
                let coolColors = ColorController.colors.filter { $0.family == .cool }
                snapshot.appendItems(coolColors, toSection: .cool)
            case .warm:
                let warmColors = ColorController.colors.filter { $0.family == .warm }
                snapshot.appendItems(warmColors, toSection: .warm)
            }
        }
        
        dataSource?.apply(snapshot)
    }
    
    func configureCollectionViewLayot() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 8,
                                      leading: 8,
                                      bottom: 0,
                                      trailing: 8)
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: SectionHeaderCollectionReusableView.nibID, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

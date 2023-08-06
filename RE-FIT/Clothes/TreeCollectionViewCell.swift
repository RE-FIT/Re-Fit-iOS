//
//  TreeCollectionViewCell.swift
//  RE-FIT
//
//  Created by jaegu park on 6/08/23.
//

import UIKit

class TreeCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
    }
}

extension TreeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width
//        let height = collectionView.frame.height
//        let itemsPerRow: CGFloat = 2
//        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
//        let itemsPerColumn: CGFloat = 3
//        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//        let cellWidth = (width - widthPadding) / itemsPerRow
//        let cellHeight = (height - heightPadding) / itemsPerColumn
        
        return CGSize(width: 90, height: 100)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TreeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tree_CollectionViewCell", for: indexPath) as! TreeCollectionViewCell
        
        return cell
    }
}

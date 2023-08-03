//
//  ClothesCollectionViewCell.swift
//  RE-FIT
//
//  Created by jaegu park on 1/08/23.
//

import UIKit

class ClothesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DayView: UIView!
    @IBOutlet weak var ClothesImage: UIImageView!
    @IBOutlet weak var ClothesProgress: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        layer.cornerRadius = 15
        layer.masksToBounds = false
        
        DayView.layer.cornerRadius = 15
        DayView.layer.masksToBounds = false
        DayView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        ClothesImage.layer.cornerRadius = 10
        ClothesImage.layer.masksToBounds = true
        
        ClothesProgress.layer.cornerRadius = 5
        ClothesProgress.clipsToBounds = true
    }
    
}

extension ClothesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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
        
        return CGSize(width: 168, height: 145)
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
        let cell: ClothesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Clothes_CollectionViewCell", for: indexPath) as! ClothesCollectionViewCell
        
        return cell
    }
}

//
//  ShareWritingCollectionViewCell.swift
//  RE-FIT
//
//  Created by jaegu park on 24/07/23.
//

import UIKit

class ShareWritingCollectionViewCell: UICollectionViewCell {

}

extension ShareWritingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 35
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 30, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShareWritingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareWriting_CollectionViewCell", for: indexPath) as! ShareWritingCollectionViewCell
        
        return cell
    }
}

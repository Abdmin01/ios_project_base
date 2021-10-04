//
//  CustomCollectionView.swift
//  ios_project_base
//
//  Created by Abdmin on 04/10/2021.
//

import UIKit

class CustomCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !(__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize)) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

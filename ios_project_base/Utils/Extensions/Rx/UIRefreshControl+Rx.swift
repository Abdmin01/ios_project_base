//  
//  UIRefreshControl+Rx.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIRefreshControl {
    func isRefreshing(in collectionView: UICollectionView) -> Binder<Bool> {
        return Binder(self.base) { refreshControl, refresh in
            if refresh {
                refreshControl.beginRefreshing()
                collectionView.setContentOffset(
                    CGPoint(x: 0, y: -refreshControl.frame.size.height),
                    animated: true
                )
            } else {
                refreshControl.endRefreshing()
                collectionView.setContentOffset(.zero, animated: true)
            }
        }
    }
}

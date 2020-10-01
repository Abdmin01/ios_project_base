//  
//  PinterestLayout+Rx.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: PinterestLayout {

    private var delegate: RxPinterestLayoutDelegateProxy {
        return RxPinterestLayoutDelegateProxy.proxy(for: base)
    }

    func updateSize(_ indexPath: IndexPath) -> Binder<CGSize> {
        return Binder(base) { base, size in
            self.delegate.sizes[indexPath] = size
            base.invalidateLayout()
        }
    }
}

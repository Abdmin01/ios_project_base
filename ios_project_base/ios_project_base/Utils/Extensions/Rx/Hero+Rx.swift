//  
//  Hero+Rx.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Hero

extension Reactive where Base: UIView {

    /// Bindable sink for `hero.id`.
    public var heroId: Binder<String> {
        return Binder(base) { view, id in
            view.hero.id = id
        }
    }

}


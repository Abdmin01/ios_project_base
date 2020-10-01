//  
//  UIBarButtonItem+Rx.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIBarButtonItem {
    
    /// Bindable sink for `image` property.
    public var image: Binder<UIImage> {
        return Binder(base) { button, image in
            button.image = image
        }
    }
}


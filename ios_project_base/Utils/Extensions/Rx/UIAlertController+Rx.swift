//  
//  UIAlertController+Rx.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIAlertController {
    
    /// Bindable sink for `title`.
    public var title: Binder<String> {
        return Binder(base) { alertController, title in
            alertController.title = title
        }
    }
    
    /// Bindable sink for `message`.
    public var message: Binder<String> {
        return Binder(base) { alertController, message in
            alertController.message = message
        }
    }
}

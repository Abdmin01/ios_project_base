//
//  SceneCoordinatorType.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import UIKit
import RxSwift

protocol SceneCoordinatorType {
    init(window: UIWindow)
    
    @discardableResult func transition(to scene: TargetScene) -> Observable<Void>
    @discardableResult func pop(animated: Bool) -> Observable<Void>
}

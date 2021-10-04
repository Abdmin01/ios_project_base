//
//  Scene.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import UIKit

/**
     Refers to a screen managed by a view controller.
     It can be a regular screen, or a modal dialog.
     It comprises a view controller and a view model.
 */

protocol TargetScene {
    var transition: SceneTransitionType { get }
}

//enum Scene {
//
//}

//extension Scene: TargetScene {
//    var transition: SceneTransitionType {
//        switch self {
//
//        }
//    }
//}

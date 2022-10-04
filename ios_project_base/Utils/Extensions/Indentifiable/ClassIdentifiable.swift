//  
//  ClassIdentifiable.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import UIKit

protocol ClassIdentifiable: AnyObject {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}

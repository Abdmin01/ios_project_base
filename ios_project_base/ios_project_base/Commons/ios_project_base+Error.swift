//
//  ios_project_base+Error.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation

extension ios_project_base {
    enum Error: LocalizedError {
        case noAccessToken
        case other(message: String)

        var errorDescription: String {
            switch self {
            case .noAccessToken:
                return "Please provide the access token."
            case let .other(message: message):
                return message
            }
        }
    }
}

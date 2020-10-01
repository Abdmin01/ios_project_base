//
//  ios_project_base+HostProvider.swift
//  ios_project_base
//
//  Created by Abdmin Azmi on 01/10/2020.
//

import Foundation

extension ios_project_base {
    enum HostProvider {
        static let host = "<#Host#>.com"
        static let callbackURLScheme = "<#URLScheme#>://"
        static let googleID = Secrets.googleID
        static let baseURL = Secrets.baseURL
        static let redirectURL = "<#RedirectURl#>://<#HostProvider#>"
    }
}

extension ios_project_base.HostProvider {
    enum Secrets {
        static let googleID = Secrets.environmentVariable(named: "<#Google_ID#>") ?? ""
        static let baseURL = Secrets.environmentVariable(named: "<#Base_URL#>") ?? ""

        private static func environmentVariable(named: String) -> String? {
            guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[named] as? String else {
                print("‼️ Missing Environment Variable: '\(named)'")
                return nil
            }
            return value
        }
    }
}

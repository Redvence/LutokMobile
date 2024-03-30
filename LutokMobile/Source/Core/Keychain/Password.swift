//
//  Password.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 30.03.2024.
//

import Foundation

// Keys for keychain to save bearer token
let account = "su.brf.apps.AuthSUI8"

struct BearerToken: Codable {
    let bearerToken: String
}

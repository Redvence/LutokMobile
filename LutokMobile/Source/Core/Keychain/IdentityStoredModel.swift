//
//  IdentityStoredModel.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 30.03.2024.
//

import Foundation

struct IdentityStoredModel: Codable {
    let token: String
}

extension IdentityStoredModel {
    static let serviceName = "ru.lutok.identity"
}

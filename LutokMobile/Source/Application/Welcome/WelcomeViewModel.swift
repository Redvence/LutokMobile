//
//  WelcomeViewModel.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

enum navigationState {
    case myFields
    case login
}


final class WelcomeViewModel: ObservableObject {
    
    @Published var navigationState: navigationState = .myFields
    @Published var profilePresented: Bool = false
    
    func onAppear() {
        
        if let identity: IdentityStoredModel = try? KeychainHelper.shared.read(
            service: IdentityStoredModel.serviceName,
            account: "ru.lutok.user",
            type: IdentityStoredModel.self
        ) {
            Service.token = identity.token
            navigationState = .myFields
            
        } else {
            
            navigationState = .login
        }
        
    }
    
}

//
//  ProfileViewModel.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

protocol ProfileViewModelDelegate: AnyObject {
    func didLogout ()
}

class ProfileViewModel: ObservableObject {
    
    private var profileIsPresentedBinding: Binding<Bool>
    private weak var delegate: ProfileViewModelDelegate?
    
    init(profileIsPresentedBinding: Binding<Bool>, delegate: ProfileViewModelDelegate?) {
        self.profileIsPresentedBinding = profileIsPresentedBinding
        self.delegate = delegate
    }
    
    func didTapLogOut() {
        KeychainHelper.shared.delete(
            service:  IdentityStoredModel.serviceName,
            account: "ru.lutok.user"
        )
        Service.token = ""
        profileIsPresentedBinding.wrappedValue.toggle()
        delegate?.didLogout()
    }
}

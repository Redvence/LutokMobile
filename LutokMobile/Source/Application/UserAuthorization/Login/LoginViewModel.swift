//
//  LoginViewModel.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

enum loginTab: String {
    case login
    case signUp
}

class LoginViewModel: ObservableObject {
    var service: AuthService = AuthService()
    
    @Published
    var enteredSignInEmail = ""
    
    @Published
    var enteredRegisterEmail = ""
    
    @Published
    var enteredSignInPassword = ""
    
    @Published
    var enteredRegisterPassword = ""
    
    @Published
    var enteredPasswordConfirmation = ""
    
    @Published
    var currentTab: loginTab = .login
    
    var navigationBinding: Binding<navigationState>
    
    init(navigationBinding: Binding<navigationState>) {
        self.navigationBinding = navigationBinding
    }
    
    func didTapLogin(){
        sendLogin()
    }
    
    func didTapRegister(){
        registerUser()
    }
    
    func didTapResetpassword(){
        //
    }
    
    func didTapTab(named: String){
        //
    }
    
    private func sendLogin() {
        
        print(enteredSignInEmail, enteredSignInPassword)
        
        service.createSession(
            username: enteredSignInEmail,
            password: enteredSignInPassword) { result in
                switch result {
                case .success(let model):
                    
                    Service.token = model.jwt
                    
                    try? KeychainHelper.shared.save(
                        IdentityStoredModel(token: model.jwt),
                        service: IdentityStoredModel.serviceName,
                        account: "ru.lutok.user"
                    )
                    
                    self.navigationBinding.wrappedValue = .myFields
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
    
    private func registerUser(){
        service.createUser(
            username: enteredRegisterEmail,
            password: enteredRegisterPassword,
            passwordConfirmation: enteredPasswordConfirmation) { result in
            switch result {
            case .success(let model):
                
                Service.token = model.jwt
                
                try? KeychainHelper.shared.save(
                    IdentityStoredModel(token: model.jwt),
                    service: IdentityStoredModel.serviceName,
                    account: "ru.lutok.user"
                )
                
                self.navigationBinding.wrappedValue = .myFields
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            }
        }
    }

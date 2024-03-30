//
//  LoginView.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    @ObservedObject
    var viewModel: LoginViewModel
    
    var body: some View {
        
        let enteredSignInEmail = Binding<String>(
            get: { self.viewModel.enteredSignInEmail },
            set: { self.viewModel.enteredSignInEmail = $0 }
        )
        
        let enteredRegisterEmail = Binding<String>(
            get: { self.viewModel.enteredRegisterEmail },
            set: { self.viewModel.enteredRegisterEmail = $0 }
        )
        
        let enteredSignInPassword = Binding<String>(
            get: { self.viewModel.enteredSignInPassword },
            set: { self.viewModel.enteredSignInPassword = $0 }
        )
        
        let enteredRegisterPassword = Binding<String>(
            get: { self.viewModel.enteredRegisterPassword },
            set: { self.viewModel.enteredRegisterPassword = $0 }
        )
        
        let enteredRepeatedPassword = Binding<String>(
            get: { self.viewModel.enteredPasswordConfirmation },
            set: { self.viewModel.enteredPasswordConfirmation = $0 }
        )
        
        VStack(alignment: .center, spacing: 8.0) {
            Image("A_Logo")
            Text("Войти в луток")
                .font(.system(size: 32))
            HStack(alignment: .center, spacing: 12.0) {
                Button {
                    viewModel.currentTab = .signUp
                } label: {
                    Spacer()
                    Text("Регистрация")
                        .frame(width: 166, height: 28, alignment: .center)
                        .foregroundColor(.black)
                    
                }   .background( viewModel.currentTab == .signUp ? Color.white : Color.gray )
                    .frame(width: 166, height: 32)
                    .cornerRadius(7)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)

                Button {
                    viewModel.currentTab = .login
                } label: {
                    Spacer()
                    Text("Вход")
                        .frame(width: 166, height: 28, alignment: .center)
                        .foregroundColor(.black)
                    
                }   .background( viewModel.currentTab == .login ? Color.white : Color.gray )
                    .frame(width: 166, height: 28)
                    .cornerRadius(7)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)

            }
//            .background(Color.gray)
            .padding(EdgeInsets(top: 0.0, leading: 4.0, bottom: 0.0, trailing: 4.0))
            .frame(width: 338.0, height: 64.0)
            
            if viewModel.currentTab == .login {
                VStack{
                    
                    TextField("Email", text: enteredSignInEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Пароль", text: enteredSignInPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        viewModel.didTapLogin()
                    } label: {
                        Text("Войти")
                    }
                    
                    Text("Забыли пароль? Восстановить")
                }
            } else {
                VStack{
                    TextField("Email", text: enteredRegisterEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Пароль", text: enteredRegisterPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Повторите пароль", text: enteredRepeatedPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        viewModel.didTapRegister()
                    } label:{
                        Text("Зарегистрироваться")
                    }
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 120.0, leading: 12.0, bottom: 0.0, trailing: 12.0))
    }
}

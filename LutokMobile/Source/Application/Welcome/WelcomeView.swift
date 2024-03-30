//
//  WelcomeView.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject
    private var viewModel = WelcomeViewModel()
    
    var body: some View {
        
        let profilePresented = Binding<Bool>(
            get: { self.viewModel.profilePresented },
            set: { self.viewModel.profilePresented = $0 }
        )
        
        let navigationBinder = Binding<navigationState>(
            get: { self.viewModel.navigationState },
            set: { self.viewModel.navigationState = $0 }
        )
        
        VStack {
            switch viewModel.navigationState {
            case .login:
                LoginView(viewModel: LoginViewModel(navigationBinding: navigationBinder))
            case .myFields:
                MyFieldsView(profileIsPresentedBinding: profilePresented, viewModel: MyFieldsViewModel(navigationBinding: navigationBinder))
                //MyFieldsView(profileIsPresentedBinding: profilePresented, viewModel: MyFieldsViewModel())
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}

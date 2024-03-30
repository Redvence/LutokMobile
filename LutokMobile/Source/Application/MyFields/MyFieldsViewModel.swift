//
//  MyFieldsModel.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 30.03.2024.
//

import Foundation
import SwiftUI

class MyFieldsViewModel: ObservableObject, ProfileViewModelDelegate {
    
    @Published var profilePresented: Bool = false
    
    var navigationBinding: Binding<navigationState>
    
    init(navigationBinding: Binding<navigationState>) {
        self.navigationBinding = navigationBinding
    }
    
    func onAppear() {}
    
    func didLogout () {
        navigationBinding.wrappedValue = .login
    }
}

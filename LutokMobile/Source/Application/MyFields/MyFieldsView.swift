//
//  MyFieldsView.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

struct MyFieldsView: View {
    
    var service: MyFieldsService = MyFieldsService()
    
    private var profileIsPresentedBinding: Binding<Bool>
    
    init(profileIsPresentedBinding: Binding<Bool>, viewModel: MyFieldsViewModel) {
        self.profileIsPresentedBinding = profileIsPresentedBinding
        self.viewModel = viewModel
    }
    
    @ObservedObject
    var viewModel: MyFieldsViewModel
    
    @State
    var items: [MyFieldListItemViewModel] = []
    
    var body: some View {
        
//        let profilePresented = Binding<Bool>(
//            get: { self.viewModel.profilePresented },
//            set: { self.viewModel.profilePresented = $0 }
//        )
        VStack {
            HStack{
                Text("Мои поля")
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                Button {
                    profileIsPresentedBinding.wrappedValue.toggle()
                } label: {
                    Text("Профиль")
                }
            }
            List {
                ForEach(items) { item in
                    MyFieldListItemView(model: item)

                }
            }
        }
        .onAppear(perform: {
            onAppear()
            viewModel.onAppear()
        })
        .sheet(isPresented: profileIsPresentedBinding) {
            ProfileView(viewModel: ProfileViewModel(
                profileIsPresentedBinding: profileIsPresentedBinding, delegate: viewModel
            ))
        }
    }
    
    func onAppear(){
        service.loadPosts { result in
            switch result {
            case .success(let model):
                self.items = model.map { .init(title: $0.title, text: $0.text.body, id: $0.text.id) }
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

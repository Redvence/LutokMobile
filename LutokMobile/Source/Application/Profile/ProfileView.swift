//
//  ProfileView.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation
import SwiftUI

//struct ProfileView: View {
//
//    var viewModel: ProfileViewModel
//
//    var body: some View {
//        VStack{
//            Button {
//                viewModel.didTapLogOut()
//            } label: {
//                Text("Log out")
//            }
//        }
//    }
//}
struct ProfileView: View {
    
    var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            header
            profileInfo
            appSettings
            Spacer()
        }
//        .background(Color.dsGray)
    }
    
    private var header: some View {
            HStack {
                Text("Профиль")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 32))
            }
    }
    
    private var profileInfo: some View {
        HStack(spacing: 8){
            Image("Avatar")
                .resizable()
                .frame(width: 88.0, height: 88.0)
                .cornerRadius(44.0)
            VStack(alignment: .leading) {
                Text("Айгуль Сайфутдинова")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                Text("@FolkloreIsSuper")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))
            }
        }
    }
    
    private var appSettings: some View {
        VStack(alignment: .leading, spacing: 20) {
                Text("Язык")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                Text("Поддержка")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                Text("Управлять аккаунтом")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                Text("Веб-версия лутка")
                    .foregroundStyle(Color.black)
                    .font(.system(size: 18))
                Button {
                    viewModel.didTapLogOut()
                } label: {
                    Text("Выйти")
            }
            }
    }
    
}

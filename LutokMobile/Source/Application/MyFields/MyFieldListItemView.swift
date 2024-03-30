//
//  MyFieldListItemView.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 30.03.2024.
//

import Foundation
import SwiftUI


struct MyFieldListItemViewModel: Codable, Identifiable, Equatable, Hashable {
    let title: String
    let text: String
    let id: Int
}

struct MyFieldListItemView: View {
    
    var model: MyFieldListItemViewModel
    
    var body: some View{
        VStack{
            Text(model.title)
                .fontWeight(.bold)
                .font(.system(size: 24))
                
            Spacer()
            Text(model.text)
                .font(.system(size: 18))
            
        }
    }
}

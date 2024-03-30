//
//  MyFieldsService.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 30.03.2024.
//

import Foundation

struct PostsResponse: Decodable, Identifiable {
    let title: String
    let text: TextModel
    
    struct TextModel: Decodable {
        let id: Int
        let name: String
        let body: String
    }
    
    var id: Int {
        return text.id
    }
}

final class MyFieldsService: Service {
    func loadPosts(
        callback: @escaping (Result<[PostsResponse], Error>) -> (Void)
    ) {
        let endPoint = "posts"
        getRequest(endpoint: endPoint, callback: callback)
    }
}

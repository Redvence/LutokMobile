//
//  AuthService.swift
//  LutokMobile
//
//  Created by Maria Vanurina on 29.03.2024.
//

import Foundation

struct RegLogResponse: Decodable {
    let jwt: String
}

final class AuthService: Service {
    
    func createSession(
        username: String,
        password: String,
        callback: @escaping (Result<RegLogResponse, Error>) -> (Void)
    ) {
        let endPoint = "sign_in"
        let body: [String: Any] = [
            "user": [
                "email": username,
                "password": password
            ]]
        
        postRequest(endpoint: endPoint, body: body, callback: callback)
    }
    
    func createUser(
        username: String,
        password: String,
        passwordConfirmation: String,
        callback: @escaping (Result<RegLogResponse, Error>) -> (Void)
    ) {
        let endPoint = "sign_up"
        let body: [String: Any] = [
            "user": [
                "email": username,
                "password": password,
                "password_confirmation": passwordConfirmation
            ]]
        
        postRequest(endpoint: endPoint, body: body, callback: callback)
    }
    
}

//
//  Model.swift
//  UIKitPlayaround
//
//  Created by Isabella Sulisufi on 18/10/2024.
//

import Foundation

struct UsersResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}

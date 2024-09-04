//
//  User.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/27/21.
//

import Foundation

struct User: Decodable {
    let uid: String
    let fullname: String
    let email: String
    var portfolio: Portfolio?
}

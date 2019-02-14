//
//  UserModel.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/31.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
enum InfoType:String {
    case user = "user"
    case track = "track"
}
struct UserModel:Codable {
    private enum CodingKeys:String, CodingKey {
        case id
        case catagory = "kind"
        case avator = "avatar_url"
        case name = "username"
    }
    let id:Double?
    let catagory:InfoType?
    let avator:String?
    let name:String?
}
extension UserModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Double.self, forKey: .id)
        if let tempCatagory = try? container.decode(String.self, forKey: .catagory) {
            catagory = InfoType(rawValue: tempCatagory)
        } else {
            catagory = nil
        }
        avator = try? container.decode(String.self, forKey: .avator)
        name = try? container.decode(String.self, forKey: .name)

    }
    func encode(to encoder: Encoder) throws {

    }
}

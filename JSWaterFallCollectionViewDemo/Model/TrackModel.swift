//
//  TrackModel.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/30.
//  Copyright © 2019 com.js. All rights reserved.
//

import Foundation
struct TrackModel:Codable {
    private enum CodingKeys:String, CodingKey {
        case id
        case catagory = "kind"
        case genre
        case duration
        case userId = "user_id"
        case createTime = "created_at"
        case trackTitle = "title"
        case waveform = "waveform_url"
        case streamingUrl = "stream_url"
        case user = "user"
        case artwork = "artwork_url"
    }
    let catagory:InfoType?
    let id:Double?
    let genre:String?
    let duration:Double?
    let userId:Double?
    let createTime:String?
    let trackTitle:String?
    let waveform:String?
    let streamingUrl:String?
    let user:UserModel?
    let artwork:String?
}
extension TrackModel {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Double.self, forKey: .id)
        genre = try? container.decode(String.self, forKey: .genre)
        duration = try? container.decode(Double.self, forKey: .duration)
        userId = try? container.decode(Double.self, forKey: .userId)
        createTime = try? container.decode(String.self, forKey: .createTime)
        trackTitle = try? container.decode(String.self, forKey: .trackTitle)
        if let tempCatagory = try? container.decode(String.self, forKey: .catagory) {
            catagory = InfoType(rawValue: tempCatagory)
        } else {
            catagory = nil
        }
        waveform = try? container.decode(String.self, forKey: .waveform)
        streamingUrl = try? container.decode(String.self, forKey: .streamingUrl)
        user = try? container.decode(UserModel.self, forKey: .user)
        artwork = try? container.decode(String.self, forKey: .artwork)
    }
    
    func encode(to encoder: Encoder) throws {

    }
}

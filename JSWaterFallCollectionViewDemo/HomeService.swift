//
//  HomeService.swift
//  JSWaterFallCollectionViewDemo
//
//  Created by joseewu on 2019/1/30.
//  Copyright © 2019 com.js. All rights reserved.
//
enum ServiceError: LocalizedError {
    case alreadyExists, notFound
    var errorDescription: String? {
        switch self {
        case .notFound: return "not found"
        case .alreadyExists: return "already exists"
        }
    }
}
protocol ServiceSpec {
    var mainURL:String{get}
    var clientID:String {get}
}
protocol HomeServiceSpec:ServiceSpec {
    var mainURL:String {get}
    func getPromotTracks() -> Observable<Array<TrackModel>>
    func getTrack()
}

import Alamofire
import RxAlamofire
import RxSwift
import RxCocoa
import Foundation
enum HomeServiceEndpoint:String {
    case track = "/tracks"
}
class HomeService:HomeServiceSpec {
    var mainURL: String = "https://api.soundcloud.com"
    var clientID:String = "70dd6cb1f3807a0d2032161d666b5f87"
    init() {

    }
    func getPromotTracks() -> Observable<Array<TrackModel>> {
        let para = ["client_id":clientID]
        let result = RxAlamofire.request(.get, mainURL + HomeServiceEndpoint.track.rawValue, parameters: para, encoding: URLEncoding.default, headers: nil).responseJSON().mapResponse(Array<TrackModel>.self)
        return result
    }
    func getTrack() {

    }
    
    
}

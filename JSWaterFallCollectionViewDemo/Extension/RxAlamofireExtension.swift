//
//  RxAlamofireExtension.swift
//  RockMe
//
//  Created by joseewu on 2018/11/27.
//  Copyright © 2018 com.tideisun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import Reachability

enum RMResponseError:Error {
    case noData
    case noResponse
}
enum RMRequestError:Error {
    case noConnection
    case noRequest
}

extension ObservableType where E == DataResponse<Any> {
    
    func mapResponse<T>(_ type: T.Type) -> Observable<T> where T: Codable {
        return self.flatMapLatest({ (response) -> Observable<T> in
            guard let data = response.data else {
                throw RMResponseError.noData
            }
            let josnDecoder = JSONDecoder()
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
                let object = try josnDecoder.decode(T.self, from:data)
                return Observable.just(object)
            } catch {
                throw RMResponseError.noData
            }
        })
    }
    func mapResponse<T>(with key:String, type modelType:T.Type) -> Observable<T> where T: Codable {
        return self.flatMapLatest({ (response) -> Observable<T> in
            guard let data = response.data else {
                throw RMResponseError.noData
            }
            let josnDecoder = JSONDecoder()
            do {
                let object = try josnDecoder.decode(T.self, from:data)
                return Observable.just(object)
            } catch {
                throw RMResponseError.noData
            }
        })
    }
}

extension ObservableType where E == DataRequest {
    func checkNetWorkStatus() -> Observable<Bool> {
        return self.flatMapLatest({ (request) -> Observable<Bool> in
            guard let reachability = Reachability() else {
                throw RMRequestError.noConnection
            }
            switch reachability.connection {
            case .cellular:
                return Observable.just(true)
            case .none:
                return Observable.just(false)
            case .wifi:
                return Observable.just(true)
            }
        })
    }
}


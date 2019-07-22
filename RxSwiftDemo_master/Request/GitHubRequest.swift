//
//  GitHubRequest.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol GitHubRequest: Request {
    
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}

extension GitHubRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

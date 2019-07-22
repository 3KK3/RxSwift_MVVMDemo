//
//  GitHubAPI.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation
import APIKit

final class GitHubAPI {
    private init() {
        
    }
    
    struct SearchRepositoriesRequest: GitHubRequest, PaginationRequest {
        let query: String
        var page: Int
        
        init(query: String, page: Int = 1) {
            self.query = query
            self.page = page
        }
        
        // MARK: RequestType
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: Any? {
            return ["q": query, "page": page]
        }
    }
}

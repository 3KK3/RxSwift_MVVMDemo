//
//  Repository.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation
import Himotoki

struct Repository: Decodable {
    let id: Int
    let fullName: String
    let stargazersCount: Int
    
    static func decode(_ e: Extractor) throws -> Repository {
        return try Repository(
            id:              e <| "id",
            fullName:        e <| "full_name",
            stargazersCount: e <| "stargazers_count"
        )
    }
}

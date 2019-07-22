//
//  PaginationResponse.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation
import Himotoki

struct SearchResponse<Element: Decodable>: PaginationResponse {
    let elements: [Element]
    let page: Int
    let nextPage: Int?
}


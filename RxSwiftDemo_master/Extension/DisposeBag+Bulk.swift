//
//  DisposeBag+Bulk.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import Foundation
import RxSwift

extension DisposeBag {
    func insert(_ disposables: [Disposable]) {
        disposables.forEach(insert)
    }
}

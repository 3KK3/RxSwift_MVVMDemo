//
//  UITableView+Rx.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol BindableCell {
    associatedtype Value
    func bind(_ value: Value)
}

extension Reactive where Base: UITableView {
    func items<S: Sequence, Cell: UITableViewCell, O: ObservableType>(
        cellIdentifier: String,
        cellType: Cell.Type)
        ->
        (O) -> (Disposable)
        where O.Element == S, Cell: BindableCell, Cell.Value == S.Iterator.Element {
            return { source in
                let binder: (Int, Cell.Value, Cell) -> Void = { $2.bind($1) }
                return self.items(cellIdentifier: cellIdentifier, cellType: cellType)(source)(binder)
            }
    }
}

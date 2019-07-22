//
//  RepositoryCellTableViewCell.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit


class RepositoryCell: UITableViewCell, BindableCell {
    func bind(_ repository: Repository) {
        textLabel?.text = repository.fullName
        detailTextLabel?.text = "🌟\(repository.stargazersCount)"
    }
}

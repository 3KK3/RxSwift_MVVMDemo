//
//  SearchRepositoriesViewController.swift
//  RxSwiftDemo_master
//
//  Created by ZMJ on 2019/7/22.
//  Copyright © 2019 ZMJ. All rights reserved.
//

import UIKit
import RxSwift

class SearchRepositoriesViewController: UITableViewController {
    var indicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private let disposeBag = DisposeBag()
    private var viewModel: PaginationViewModel<Repository>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseRequest = GitHubAPI.SearchRepositoriesRequest(query: "Swift")
        
        viewModel = PaginationViewModel(
            baseRequest: baseRequest,
            viewWillAppear: rx.viewWillAppear.asDriver(),
            scrollViewDidReachBottom: tableView.rx.reachedBottom.asDriver())
        
        disposeBag.insert([
            viewModel.indicatorViewAnimating.drive(indicatorView.rx.isAnimating),
            viewModel.elements.drive(tableView.rx.items(cellIdentifier: "Cell", cellType: RepositoryCell.self)),
            viewModel.loadError.drive(onNext: { print($0) }),
            ])
    }
}

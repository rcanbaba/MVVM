//
//  MovieHomeViewController.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 4.10.2022.
//

import UIKit
import SnapKit

final class MovieHomeViewController: UIViewController {
    
    //TODO: add view components a new UIView class then add here (MovieHomeViewController)
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.register(RMTableViewCell.self, forCellReuseIdentifier: RMTableViewCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        //tableView.rowHeight = 120
        tableView.backgroundColor = .lightGray
        tableView.separatorStyle = .none
        //TODO: if needed implement
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = .white
        tableView.layer.cornerRadius = 10.0
        return tableView
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .bold)
        label.text = "Movies"
        return label
    }()
    
    private let service = Services()
    private var searchResults = [Result]()
    private var viewModel: MovieHomeViewModel = MovieHomeViewModel(service: Services())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        configureUI()
        getData()
    }
    
    private func configureUI() {
        setTitleLabel()
        setTableView()
    }
    
    private func getData() {
        viewModel.fetchMovies { [weak self] (response) in
            if let results = response?.results {
                self?.searchResults = results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func setTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}

extension MovieHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = searchResults[indexPath.item].title ?? "unknown"
        return cell
    }
}

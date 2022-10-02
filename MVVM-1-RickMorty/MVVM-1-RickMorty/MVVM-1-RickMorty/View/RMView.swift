//
//  RMView.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import UIKit
import SnapKit

final class RMView: UIView {
    
    private lazy var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RMTableViewCell.self, forCellReuseIdentifier: RMTableViewCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setTableView()
        setIndicatorView()
    }
    
    private func setTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(5)
        }
    }
    
    private func setIndicatorView() {
        addSubview(indicator)
        indicator.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
    }
    
}

// MARK: Public
extension RMView {
    public func setActivityIndicator(isLoading: Bool) {
        isLoading ? indicator.startAnimating() : indicator.stopAnimating()
    }
}

//
//  RMView.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import UIKit
import SnapKit

final class RMView: UIView {
    
    private lazy var indicator: UIActivityIndicatorView = {
        let style: UIActivityIndicatorView.Style
        var color: UIColor? = nil
        if #available(iOS 13.0, *) {
            style = .large
            color = .lightGray
        } else {
            style = .gray
        }
        
        let view = UIActivityIndicatorView(style: style)
        view.hidesWhenStopped = true
        if let color = color {
            view.color = color
        }
        view.stopAnimating()
        return view
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RMTableViewCell.self, forCellReuseIdentifier: RMTableViewCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = 120
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
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
        label.text = "Rick and Morty Characters".localize()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        layer.cornerRadius = 16.0
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        setTitleLabel()
        setTableView()
        setIndicatorView()
    }
    
    private func setTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }
    }
    
    private func setTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func setIndicatorView() {
        addSubview(indicator)
        indicator.snp.makeConstraints { (make) in
            make.height.equalTo(100)
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

//
//  RMViewController.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 1.10.2022.
//

import UIKit

protocol RMViewControllerOutput {
    func setActivityIndicator(isLoading: Bool)
    func saveData(values: [CharacterResponseResultModel])
}

final class RMViewController: UIViewController {
    
    private lazy var rickMortyView = RMView()
    private lazy var characterArray: [CharacterResponseResultModel] = []
    private lazy var viewModel: RMViewModelProtocol = RMViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        rickMortyView.tableView.delegate = self
        rickMortyView.tableView.dataSource = self
        configureUI()
        bindActions()
        viewModel.fetchItems()
        viewModel.setDelegate(output: self)
    }
    
    private func configureUI() {
        view.addSubview(rickMortyView)
        rickMortyView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
        
    private func bindActions() {
        rickMortyView.tableView.refreshControl?.addTarget(
            self,
            action: #selector(refreshCharTableView(_:)),
            for: .valueChanged
        )
    }
    
    @objc private func refreshCharTableView(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        viewModel.fetchItems()
    }
    
}

extension RMViewController: RMViewControllerOutput {
    func setActivityIndicator(isLoading: Bool) {
        rickMortyView.setActivityIndicator(isLoading: isLoading)
    }
    
    func saveData(values: [CharacterResponseResultModel]) {
        characterArray = values
        rickMortyView.tableView.reloadData()
    }
}

extension RMViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell: RMTableViewCell = tableView.dequeueReusableCell(withIdentifier: RMTableViewCell.Identifier.custom.rawValue) as? RMTableViewCell else {
//            return UITableViewCell()
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RMTableViewCell.reuseIdentifier, for: indexPath) as! RMTableViewCell
        
        let cellData = characterArray[indexPath.row]
        cell.set(title: cellData.name ?? "no name")
        cell.set(description: cellData.status?.rawValue ?? "unknown status")
        cell.set(imageUrl: cellData.url)
        return cell
    }
    
    
}

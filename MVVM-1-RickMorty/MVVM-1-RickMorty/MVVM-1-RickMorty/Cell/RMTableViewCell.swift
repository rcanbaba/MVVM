//
//  RMTableViewCell.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import UIKit
import AlamofireImage

class RMTableViewCell: UITableViewCell {
    
    private lazy var customImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .brown
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(customImage)
        customImage.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.top.equalTo(contentView)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(customImage.snp.bottom).offset(10)
            make.leading.trailing.equalTo(contentView)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(5)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview()
        }
    }

}

// MARK: Public
extension RMTableViewCell {
    public func set(title: String) {
        titleLabel.text = title
    }
    public func set(description: String) {
        descriptionLabel.text = description
    }
    public func set(imageUrl: String?) {
        customImage.af.setImage(withURL: URL(string: imageUrl ?? randomImage) ?? URL(string: randomImage)!)
    }
    
}

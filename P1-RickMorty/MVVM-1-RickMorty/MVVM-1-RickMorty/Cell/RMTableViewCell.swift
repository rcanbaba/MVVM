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
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemPink
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemPurple
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        return label
    }()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        ImageResponseSerializer.addAcceptableImageContentTypes(["binary/octet-stream"])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(customImage)
        customImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(16)
            make.size.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(16)
            make.leading.equalTo(customImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(6)
            make.leading.equalTo(customImage.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
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
        //TODO: there was an AFImage bug, try later Kingfisher
        customImage.af.setImage(withURL: URL(string: imageUrl ?? randomImage) ?? URL(string: randomImage)!)
    }
    
}

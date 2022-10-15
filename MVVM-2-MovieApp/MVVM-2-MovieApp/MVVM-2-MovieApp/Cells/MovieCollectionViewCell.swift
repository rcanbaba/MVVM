//
//  MovieCollectionViewCell.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 15.10.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class MovieCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.layer.backgroundColor = UIColor.purple.withAlphaComponent(0.5).cgColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.text = "Movies"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }

    private func configureUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

extension MovieCollectionViewCell {
    
    public func setImage(_ urlString: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/original/" + urlString)
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "empty-bg"))
    }
    
    public func setName(_ name: String) {
        titleLabel.text = " "+name
    }
}

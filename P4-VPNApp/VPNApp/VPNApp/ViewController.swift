//
//  ViewController.swift
//  VPNApp
//
//  Created by Can Babaoğlu on 30.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var emptyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(onButtonTap(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 10.0
        button.setTitle("Connect", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        
        configureUI()
    }

    private func configureUI() {
        view.addSubview(emptyButton)
        emptyButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(60)
            make.center.equalToSuperview()
        }
    }

    
    @objc private func onButtonTap(_ sender: Any) {
        print("Button Tapped")
    }
    
}


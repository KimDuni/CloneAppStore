//
//  FeatureSectionCollectionViewCell.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//
import UIKit

import SnapKit

final class FeatureSectionCollectionViewCell: UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12.0, weight: .semibold)
        return label
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var descriptLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setup() {
        setupLayout()
        
        typeLabel.text = "type"
        appNameLabel.text = "App name"
        descriptLabel.text = "description"
        imageView.backgroundColor = .lightGray
    }
}

private extension FeatureSectionCollectionViewCell {
    func setupLayout() {
        [typeLabel,
         appNameLabel,
         descriptLabel,
         imageView
        ].forEach { view in
            addSubview(view)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(typeLabel.snp.bottom)
        }
        
        descriptLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(descriptLabel.snp.bottom).offset(4.0)
            make.bottom.equalToSuperview().inset(8.0)
        }
    }
}

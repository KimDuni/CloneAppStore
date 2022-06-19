//
//  RankingFeatureCollectionViewCell.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//

import UIKit

import SnapKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    
    static var height: CGFloat { 70.0 }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
        titleLabel.text = "앱 이름"
        descriptionLabel.text = "이러이런 앱입니다."
        inAppPurchaseInfoLabel.isHidden = [true, false].randomElement() ?? true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RankingFeatureCollectionViewCell {
    func setupLayout() {
        [imageView,
         titleLabel,
         descriptionLabel,
         downloadButton,
         inAppPurchaseInfoLabel
        ].forEach { view in
            addSubview(view)
        }

        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(4.0)
            make.bottom.equalToSuperview().inset(4.0)
            make.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
            make.height.equalTo(24.0)
            make.width.equalTo(50.0)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(downloadButton.snp.centerX)
            make.top.equalTo(downloadButton.snp.bottom).offset(4.0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(8.0)
            make.trailing.equalTo(downloadButton.snp.leading)
            make.top.equalTo(imageView.snp.top).inset(8.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
    }
}

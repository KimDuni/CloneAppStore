//
//  RankingFeatureSection.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//

import Foundation

import SnapKit
import UIKit

final class RankingFeatureSectionView: UIView {
    
    private let verticalCellCount: Int = 3 //더 많은 아이템을 보여주고 싶다면 늘려주자
    private let separatorView = SeparatorView(frame: .zero)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .black)
        label.text = "iPhone이 처음이라면"
        return label
    }()
    
    private lazy var showAllAppsButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0, right: 16.0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(RankingFeatureCollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankingFeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureCollectionViewCell", for: indexPath) as? RankingFeatureCollectionViewCell else { fatalError("hing")}
        return cell
    }
}

extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: RankingFeatureCollectionViewCell.height)
    }
}

private extension RankingFeatureSectionView {
    func setupLayout() {
        [ titleLabel,
          showAllAppsButton,
          collectionView,
          separatorView
        ].forEach { view in
            addSubview(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.0)
            make.top.equalToSuperview().inset(16.0)
            make.trailing.equalTo(showAllAppsButton.snp.leading).offset(8.0)
        }
        
        showAllAppsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16.0)
            make.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            make.height.equalTo(RankingFeatureCollectionViewCell.height * CGFloat(verticalCellCount))
        }
        
        separatorView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(16.0)
        }
    }
}

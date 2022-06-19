//
//  FeatureSectionView.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//

import UIKit
import SnapKit

final class FeatureSectionView: UIView {
    fileprivate let cellIdentifier: String = "FeatureSectionCollectionViewCell"
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(FeatureSectionCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return collectionView
    }()
    
    private let separator = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




extension FeatureSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FeatureSectionCollectionViewCell else { fatalError("hing") }
        cell.setup()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 32.0, height: frame.width)
    }
    
    //중앙 정렬을 위해서 16.0을 지정해줘야 좋다. 이쁘게
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        32.0
    }
}


private extension FeatureSectionView {
    func setupViews() {
        [
            collectionView,
            separator
        ].forEach { view in
            addSubview(view)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(16.0)
            make.height.equalTo(snp.width)
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16.0)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

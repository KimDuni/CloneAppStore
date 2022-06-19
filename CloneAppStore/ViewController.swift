//
//  ViewController.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        

        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = UIView()
        
        exchangeCodeButtonView.backgroundColor = .blue
        
        [featureSectionView,
         rankingFeatureSectionView,
         exchangeCodeButtonView
        ].forEach { view in
            stackView.addArrangedSubview(view)
        }
            
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
}

private extension ViewController {
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


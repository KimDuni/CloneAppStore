//
//  SeparatorView.swift
//  CloneAppStore
//
//  Created by 김성준 on 2022/06/19.
//

import UIKit

import SnapKit

final class SeparatorView: UIView {
    private lazy var separtor: UIView = {
        let view = UIView()
        view.backgroundColor = .separator //UIColor중 separtor컬러도 있다. 테이블뷰의 Separator와 같은 느낌...
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separtor)
        separtor.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.0)
            make.top.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

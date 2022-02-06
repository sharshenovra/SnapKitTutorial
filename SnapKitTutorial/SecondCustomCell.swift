//
//  SecondCustomCell.swift
//  SnapKitTutorial
//
//  Created by Ruslan Sharshenov on 06.02.2022.
//

import UIKit
import SnapKit

class SecondCustomCell: UITableViewCell {

    lazy var title1: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var title2: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(title1)
        title1.snp.makeConstraints { make in
            make.top.left.height.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        addSubview(title2)
        title2.snp.makeConstraints { make in
            make.left.height.equalToSuperview()
            make.top.equalTo(title1.snp.bottom)
            make.height.equalToSuperview().dividedBy(2)
        }
    }

}

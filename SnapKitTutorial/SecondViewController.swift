//
//  SecondViewController.swift
//  SnapKitTutorial
//
//  Created by Ruslan Sharshenov on 06.02.2022.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    private lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var label1: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    lazy var label2: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(view1)
        view1.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        view1.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view1.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label1.snp.bottom)
        }
        
    }
   
}

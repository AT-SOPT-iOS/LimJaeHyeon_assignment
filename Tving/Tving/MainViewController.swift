//
//  MainViewController.swift
//  Tving
//
//  Created by 임재현 on 4/25/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TVING")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Search"), for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .white
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .black
        return stackView
    }()
    
    private let logoStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    private let spacerView: UIView = {
        let view = UIView()
       
        return view
    }()
    
    private let categoryList:[String] = ["홈","드라마","예능","영화","스포츠","뉴스","음악"]
    
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList:categoryList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryList, pagingTabBar: pagingTabBar)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupAddSubView()
        setupUI()
    }
    
    private func setupAddSubView() {
        [logoStackView,pagingTabBar,pagingView].forEach {
            self.view.addSubview($0)
        }
        
        [searchButton,iconImageView].forEach {
            self.buttonStackView.addArrangedSubview($0)
        }
        
        [logoImageView,spacerView,buttonStackView].forEach {
            self.logoStackView.addArrangedSubview($0)
        }
        
    }
    
    private func setupUI() {
       
        logoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(78)
        }
        
        logoImageView.snp.makeConstraints {
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.width.equalTo(68)
            $0.height.equalTo(30)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(30)
        }
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(30)
        }
        
        pagingTabBar.snp.makeConstraints {
            $0.top.equalTo(logoStackView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        pagingTabBar.backgroundColor = .black
        
        pagingView.snp.makeConstraints {
            $0.top.equalTo(pagingTabBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
 
    }
}








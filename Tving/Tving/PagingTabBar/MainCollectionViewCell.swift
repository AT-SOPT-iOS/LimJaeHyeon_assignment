//
//  MainTabBarCell.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    private let scrollView =  UIScrollView()
    private let contentStack:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()


    private lazy var mainPosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "whatsyourname")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let top20Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textAlignment = .center
        label.text = "오늘의 티빙 TOP 20"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let realTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textAlignment = .center
        label.text = "실시간 인기 LIVE"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let realTimeMovieLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textAlignment = .center
        label.text = "실시간 인기 영화"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    

    private lazy var top20CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // scrollDirection의 기본값은 .vertical이다
        
        let inset: CGFloat = 16.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - inset*2.0)/2.5, height: 146)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset/2, bottom: inset, right: inset)
        layout.minimumLineSpacing = 4.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(Top20CollectionViewCell.self, forCellWithReuseIdentifier: Top20CollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var realTimeLivePopularCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // scrollDirection의 기본값은 .vertical이다
        
        let inset: CGFloat = 16.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - inset*2.0)/2.5, height: 146)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset/2, bottom: inset, right: inset)
        layout.minimumLineSpacing = 4.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(RealTimePopularLiveCell.self, forCellWithReuseIdentifier: RealTimePopularLiveCell.identifier)
        
        return collectionView
    }()
    
    private lazy var realTimeMovieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // scrollDirection의 기본값은 .vertical이다
        
        let inset: CGFloat = 16.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - inset*2.0)/3.5, height: 146)
        layout.sectionInset = UIEdgeInsets(top: inset + 10, left: inset/2, bottom: inset, right: inset)
        layout.minimumLineSpacing = 4.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(RealTimeMovieCollectionViewCell.self, forCellWithReuseIdentifier: RealTimeMovieCollectionViewCell.identifier)
        
        return collectionView
    }()


        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentStack)
        self.addSubview(realTimeLabel)
        self.addSubview(realTimeMovieLabel)
        
        [mainPosterImage,top20Label, top20CollectionView, realTimeLivePopularCollectionView,realTimeMovieCollectionView].forEach {
            contentStack.addArrangedSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        top20Label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }


        mainPosterImage.snp.makeConstraints {
            $0.height.equalTo(400)
        }
        top20CollectionView.snp.makeConstraints {
            $0.height.equalTo(150)
        }
        realTimeLivePopularCollectionView.snp.makeConstraints {
            $0.height.equalTo(150)
        }
        
        realTimeMovieCollectionView.snp.makeConstraints {
            $0.height.equalTo(150)
        }
        
        realTimeLabel.snp.makeConstraints {
            $0.top.equalTo(top20CollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
        
        realTimeMovieLabel.snp.makeConstraints {
            $0.top.equalTo(realTimeLivePopularCollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            
        }
        
        top20CollectionView.backgroundColor = .black
        realTimeLivePopularCollectionView.backgroundColor = .black
        realTimeMovieCollectionView.backgroundColor = .black
        
        
        

    }
}

extension MainCollectionViewCell:UICollectionViewDelegate {
    
}

extension MainCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == top20CollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.identifier, for: indexPath) as? Top20CollectionViewCell else {return UICollectionViewCell()}
            cell.configure(rank: indexPath.row + 1, image: UIImage(named: "harryPotter"))
            return cell
        } else if collectionView == realTimeLivePopularCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimePopularLiveCell.identifier, for: indexPath) as? RealTimePopularLiveCell else {return UICollectionViewCell()}
            cell.configure(rank: indexPath.row + 1, image: UIImage(named: "transportLove"))
            return cell
        }  else if collectionView == realTimeMovieCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimeMovieCollectionViewCell.identifier, for: indexPath) as? RealTimeMovieCollectionViewCell else {return UICollectionViewCell()}
            cell.configure(rank: indexPath.row + 1, image: UIImage(named: "signal"))
            return cell
        }
        return UICollectionViewCell()

    }

}



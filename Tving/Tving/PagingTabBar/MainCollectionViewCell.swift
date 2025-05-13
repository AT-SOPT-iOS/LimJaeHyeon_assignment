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
    
    private let lifeMovieLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.textAlignment = .center
        label.text = "김가현PD의 인생작 TOP 5"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let noticeButton: UIButton = {
        let button = UIButton()
        button.setTitle("공지 티빙 계정 공유 정책 추가 안내       >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .darkGray
        return button
    }()

    private let inset: CGFloat = 16.0

    private lazy var top20CollectionView: UICollectionView = {
        let config = CollectionViewConfig(
            cellType: Top20CollectionViewCell.self,
            reuseIdentifier: Top20CollectionViewCell.identifier,
            itemWidthRatio: 2.5,
            itemHeight: 146,
            topInset: inset,
            bottomInset: inset,
            leftInset: inset/2,
            rightInset: inset,
            spacing: 4.0,
            scrollDirection: .horizontal)
        return makeCollectionView(config: config)
    }()
    
    private lazy var realTimeLivePopularCollectionView: UICollectionView = {
        let config = CollectionViewConfig(
            cellType: RealTimePopularLiveCell.self,
            reuseIdentifier: RealTimePopularLiveCell.identifier,
            itemWidthRatio: 2.5,
            itemHeight: 146,
            topInset: inset,
            bottomInset: inset,
            leftInset: inset/2,
            rightInset: inset,
            spacing: 4.0,
            scrollDirection: .horizontal)
      
        return makeCollectionView(config: config)
    }()
    
    private lazy var realTimeMovieCollectionView: UICollectionView = {
        let config = CollectionViewConfig(
            cellType: RealTimeMovieCollectionViewCell.self,
            reuseIdentifier: RealTimeMovieCollectionViewCell.identifier,
            itemWidthRatio: 3.5,
            itemHeight: 146,
            topInset: inset + 10,
            bottomInset: inset,
            leftInset:  inset/2,
            rightInset: inset,
            spacing: 4.0,
            scrollDirection: .horizontal)

        return makeCollectionView(config: config)
    }()
    
    private lazy var baseBallCollectionView: UICollectionView = {
        let config = CollectionViewConfig(
            cellType: BaseballCollectionViewCell.self,
            reuseIdentifier: BaseballCollectionViewCell.identifier,
            itemWidthRatio: 4.5,
            itemHeight: 50,
            topInset: inset + 10,
            bottomInset: inset,
            leftInset: inset/2,
            rightInset: inset,
            spacing: 2,
            scrollDirection: .horizontal)

        return makeCollectionView(config: config)
    }()
    
    private lazy var TVCollectionView: UICollectionView = {
        let config = CollectionViewConfig(
            cellType: TVCollectionViewCell.self,
            reuseIdentifier: TVCollectionViewCell.identifier,
            itemWidthRatio: 3.5,
            itemHeight: 45,
            topInset: inset + 10,
            bottomInset: inset,
            leftInset: inset/2,
            rightInset: inset,
            spacing: 8,
            scrollDirection: .horizontal)
        
        return makeCollectionView(config: config)
    }()
    
    private lazy var lifeMovieCollectionView: UICollectionView = {
        let config = CollectionViewConfig(cellType: lifeMovieCollectionViewCell.self, reuseIdentifier: lifeMovieCollectionViewCell.identifier, itemWidthRatio: 2.5, itemHeight: 90, topInset: inset + 10, bottomInset: inset, leftInset: inset/2, rightInset: inset, spacing: 8, scrollDirection: .horizontal)
        
        return makeCollectionView(config: config)
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
        self.addSubview(lifeMovieLabel)
        self.addSubview(noticeButton)
        
        [mainPosterImage,top20Label, top20CollectionView, realTimeLivePopularCollectionView,realTimeMovieCollectionView,baseBallCollectionView,TVCollectionView,lifeMovieCollectionView].forEach {
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
        
        baseBallCollectionView.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        TVCollectionView.snp.makeConstraints {
            $0.height.equalTo(45)
        }
        
        lifeMovieCollectionView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        
        
        
        realTimeLabel.snp.makeConstraints {
            $0.top.equalTo(top20CollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
        
        realTimeMovieLabel.snp.makeConstraints {
            $0.top.equalTo(realTimeLivePopularCollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            
        }
        
        lifeMovieLabel.snp.makeConstraints {
            $0.top.equalTo(TVCollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
        }
        
        noticeButton.snp.makeConstraints {
            $0.top.equalTo(lifeMovieCollectionView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        top20CollectionView.backgroundColor = .black
        realTimeLivePopularCollectionView.backgroundColor = .black
        realTimeMovieCollectionView.backgroundColor = .black
        baseBallCollectionView.backgroundColor = .black
        TVCollectionView.backgroundColor = .black
        lifeMovieCollectionView.backgroundColor = .black

    }
}

extension MainCollectionViewCell:UICollectionViewDelegate {
    
}

extension MainCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView {
            case top20CollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: Top20CollectionViewCell.self,
                    identifier: Top20CollectionViewCell.identifier,
                    imageName: "harryPotter",
                    backgroundColor: .clear
                )

            case realTimeLivePopularCollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: RealTimePopularLiveCell.self,
                    identifier: RealTimePopularLiveCell.identifier,
                    imageName: "transportLove",
                    backgroundColor: .clear
                )

            case realTimeMovieCollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: RealTimeMovieCollectionViewCell.self,
                    identifier: RealTimeMovieCollectionViewCell.identifier,
                    imageName: "signal",
                    backgroundColor: .clear
                )

            case baseBallCollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: BaseballCollectionViewCell.self,
                    identifier: BaseballCollectionViewCell.identifier,
                    imageName: "image 103",
                    backgroundColor: .white
                )

            case TVCollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: TVCollectionViewCell.self,
                    identifier: TVCollectionViewCell.identifier,
                    imageName: "appleTV",
                    backgroundColor: .black
                )

            case lifeMovieCollectionView:
                return dequeueAndConfigure(
                    collectionView: collectionView,
                    indexPath: indexPath,
                    cellType: lifeMovieCollectionViewCell.self,
                    identifier: lifeMovieCollectionViewCell.identifier,
                    imageName: "image",
                    backgroundColor: .black
                )

            default:
                return UICollectionViewCell()
            }

    }
    
    private func dequeueAndConfigure<T: UICollectionViewCell>(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        cellType: T.Type,
        identifier: String,
        imageName: String,
        backgroundColor: UIColor
    ) -> UICollectionViewCell where T: ConfigurableCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            return UICollectionViewCell()
        }

        let rank = indexPath.row + 1
        let image = UIImage(named: imageName)
        cell.configure(rank: rank, image: image)
        cell.backgroundColor = backgroundColor
        return cell
    }


}

extension MainCollectionViewCell {
    func makeCollectionView(config:CollectionViewConfig) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = config.scrollDirection
        
        let inset: CGFloat = 16.0
        let width = (UIScreen.main.bounds.width - inset * 2)/config.itemWidthRatio
        layout.itemSize = CGSize(width: width, height: config.itemHeight)
        layout.sectionInset = UIEdgeInsets(top: config.topInset,
                                           left: inset/2,
                                           bottom: config.bottomInset,
                                           right: inset)
        layout.minimumLineSpacing = config.spacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(config.cellType, forCellWithReuseIdentifier: config.reuseIdentifier)
        
        return collectionView

    }
}



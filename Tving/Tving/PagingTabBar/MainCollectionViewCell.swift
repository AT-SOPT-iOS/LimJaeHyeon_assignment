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
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
    
        [mainPosterImage,top20Label,top20CollectionView].forEach { addSubview($0) }
        
        mainPosterImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        top20Label.snp.makeConstraints {
            $0.top.equalTo(mainPosterImage.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(8)
        }
        
        top20CollectionView.snp.makeConstraints {
            $0.top.equalTo(top20Label.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(150)
        }
        
        top20CollectionView.backgroundColor = .black
    }
}

extension MainCollectionViewCell:UICollectionViewDelegate {
    
}

extension MainCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Top20CollectionViewCell.identifier, for: indexPath) as? Top20CollectionViewCell else {return UICollectionViewCell()}
        cell.configure(rank: indexPath.row + 1, image: UIImage(named: "harryPotter"))
        return cell
    }

}



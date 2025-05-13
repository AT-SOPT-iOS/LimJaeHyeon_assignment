//
//  Top20CollectionView.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit
import SnapKit


class Top20CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Top20CollectionViewCell"
    
    
    private let rankLabel: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 30 ,weight: .bold)
        label.textColor = .white
        label.transform = CGAffineTransform(rotationAngle: .pi / 30)
        label.textAlignment = .center
        return label
    }()
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "harryPotter")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rankLabel, posterImage])
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .bottom
        stack.distribution = .fill
        return stack
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
        contentView.addSubview(horizontalStack)

        horizontalStack.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }

        posterImage.snp.makeConstraints {
            $0.width.equalTo(posterImage.snp.height).multipliedBy(0.75)
        }
        rankLabel.snp.makeConstraints {
            $0.bottom.equalTo(posterImage.snp.bottom).offset(-4) // 포스터 아래로 살짝 이동
            $0.leading.equalTo(posterImage.snp.leading).offset(8) // 포스터 왼쪽에 위치
            $0.width.equalTo(30) // 숫자 너비 고정
        }
        
        rankLabel.numberOfLines = 1
           rankLabel.lineBreakMode = .byTruncatingTail
           // Z축 위로 올리기
           rankLabel.layer.zPosition = 1  // rankLabel을 다른 뷰보다 위로 올림(Z 인덱스)
           // 글씨 크기 자동으로 조정되게 하기
           rankLabel.adjustsFontSizeToFitWidth = true // 글씨가 공간에 맞춰 자동으로 줄어듬
           rankLabel.minimumScaleFactor = 0.5 // 최소 50% 크기로 줄어들게 설정
    }
 
}

extension Top20CollectionViewCell:ConfigurableCell {
    func configure(rank: Int, image: UIImage?) {
        rankLabel.text = "\(rank)"
        posterImage.image = image
    }
}


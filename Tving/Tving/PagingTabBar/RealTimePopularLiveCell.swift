//
//  RealTimePopularLiveCell.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit
import SnapKit


class RealTimePopularLiveCell: UICollectionViewCell  {
    static let identifier = "RealTimePopularLiveCell"

    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "transportLove")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 30 ,weight: .bold)
        label.textColor = .white
        label.transform = CGAffineTransform(rotationAngle: .pi / 30)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "JTBC"
        label.font = .systemFont(ofSize: 12 ,weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.text = "이혼숙려캠프 34화"
        label.font = .systemFont(ofSize: 12 ,weight: .thin)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "27.2%"
        label.font = .systemFont(ofSize: 12 ,weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, episodeLabel,ratingLabel])
        stack.axis = .vertical
        stack.spacing = 1
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rankLabel, verticalStack])
        stack.axis = .horizontal
        stack.spacing = 3
        stack.distribution = .fill
        stack.alignment = .top
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
        self.addSubview(horizontalStack)
        self.addSubview(posterImage)

        posterImage.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.height.equalToSuperview().multipliedBy(0.65)
            }
            

            horizontalStack.snp.makeConstraints {
                $0.top.equalTo(posterImage.snp.bottom).offset(8)
                $0.leading.trailing.bottom.equalToSuperview()
            }

    }

}

extension RealTimePopularLiveCell: ConfigurableCell {
    func configure(rank: Int, image: UIImage?) {
        rankLabel.text = "\(rank)"
        posterImage.image = image
    }
}

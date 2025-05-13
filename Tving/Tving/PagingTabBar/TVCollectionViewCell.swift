//
//  TVCollectionViewCell.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit
import SnapKit

class TVCollectionViewCell: UICollectionViewCell,ConfigurableCell {
    
    static let identifier = "TVCollectionViewCell"

    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        self.addSubview(posterImage)

        posterImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }


    }
    func configure(rank: Int, image: UIImage?) {
        posterImage.image = image
    }
}

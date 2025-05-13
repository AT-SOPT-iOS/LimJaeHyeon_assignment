//
//  CollectionViewConfig.swift
//  Tving
//
//  Created by 임재현 on 5/13/25.
//

import UIKit

struct CollectionViewConfig {
    let cellType: UICollectionViewCell.Type
    let reuseIdentifier: String
    let itemWidthRatio: CGFloat
    let itemHeight: CGFloat
    let topInset: CGFloat
    let bottomInset: CGFloat
    let leftInset: CGFloat
    let rightInset: CGFloat
    let spacing: CGFloat
    let scrollDirection: UICollectionView.ScrollDirection
}

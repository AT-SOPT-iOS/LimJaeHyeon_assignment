//
//  UIButton.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit

extension UIButton {
    func setUnderLine(range: NSRange, underlineOffset: CGFloat = 5, for state: UIControl.State = .normal) {
        guard let title = self.title(for: state), let titleLabel = self.titleLabel else { return }
        
        let font = titleLabel.font ?? UIFont.systemFont(ofSize: 17)
        let attributedString = NSMutableAttributedString(string: title, attributes: [
            .font: font
        ])
        
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        attributedString.addAttribute(.baselineOffset, value: underlineOffset, range: range)
        
        self.setAttributedTitle(attributedString, for: state)
    }
}

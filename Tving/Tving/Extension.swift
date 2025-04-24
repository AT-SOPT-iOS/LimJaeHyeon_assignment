//
//  Extension.swift
//  Tving
//
//  Created by 임재현 on 4/24/25.
//

import UIKit

extension UILabel {
    func setUnderLine(range: NSRange,underlineOffset: CGFloat = 5) {
        guard let attributedString = self.mutableAttributedString() else {return}
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        attributedString.addAttribute(.baselineOffset, value: underlineOffset, range: range)
        
        self.attributedText = attributedString
        
        
    }
    
    private func mutableAttributedString() -> NSMutableAttributedString? {
        guard let labelText = self.text, let labelFont = self.font else {return nil}
        
        var attributedString: NSMutableAttributedString?
        if let attributedText = self.attributedText {
            attributedString = attributedText.mutableCopy() as? NSMutableAttributedString
        } else {
            attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: labelFont])
        }
        
        return attributedString
    }
}

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

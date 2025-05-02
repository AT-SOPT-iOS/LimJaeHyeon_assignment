//
//  UILabel+.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
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

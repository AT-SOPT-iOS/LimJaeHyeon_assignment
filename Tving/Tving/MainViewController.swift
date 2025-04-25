//
//  MainViewController.swift
//  Tving
//
//  Created by 임재현 on 4/25/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var receivedText: String?
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLabel()
    }
    
    func setDisplayText(_ text: String?) {
        self.receivedText = text
        if isViewLoaded {
            updateLabelText()
        }
    }
    
    private func setupLabel() {
        view.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        updateLabelText()
    }
    
    private func updateLabelText() {
           if let text = receivedText {
               emailLabel.text = "입력한 ID: \(text)"
           } else {
               emailLabel.text = "입력된 ID 없음"
           }
       }
}

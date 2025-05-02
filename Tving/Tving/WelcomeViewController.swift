//
//  WelcomeViewController.swift
//  Tving
//
//  Created by 임재현 on 5/2/25.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    private var receivedText: String?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let moveToMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.backgroundColor = .tvingRed
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLabel()
        setupUI()
        setupAddTarget()
    }
    
    func setupUI() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(moveToMainButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        moveToMainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(52)
        }
    }
    
    func setDisplayText(_ text: String?) {
        self.receivedText = text
        if isViewLoaded {
            updateLabelText()
        }
    }
    
    private func setupLabel() {
        view.addSubview(logoImageView)
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
    
    private func setupAddTarget() {
        moveToMainButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    func buttonDidTap() {
        let mainVieController = MainViewController()
        self.navigationController?.pushViewController(mainVieController, animated: false)
    }

}

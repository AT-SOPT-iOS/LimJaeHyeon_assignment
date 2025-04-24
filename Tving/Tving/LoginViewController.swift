//
//  LoginViewController.swift
//  Tving
//
//  Created by 임재현 on 4/23/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tving ID 로그인"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ID를 입력해주세요"
        textField.backgroundColor = .red
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password를 입력해주세요"
        textField.backgroundColor = .red
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .tvingRed
        button.setUnderLine(range: NSRange(location: 0, length: 5))
      //  button.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    private let findIDLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let findPWDLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let findStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.backgroundColor = .blue
        stackView.distribution = .fill
        return stackView
    }()
    
    let borderView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let notYetLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    //Todo:  Label vs Button // 이름 하단에 밑줄 알아보기
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tving 회원가입하기", for: .normal)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupLayout()
        if let text = titleLabel.text {
                   let fullRange = NSRange(location: 0, length: text.count)
                   titleLabel.setUnderLine(range: fullRange)
               }
    }
    
    private func setupLayout() {
        
        [titleLabel,idTextField,passwordTextField,loginButton,findStackView].forEach {
            self.view.addSubview($0)
        }
        //addSubView 쓰면 뷰들이 수동으로 정렬됨
        [findIDLabel,borderView,findPWDLabel].forEach {
            self.findStackView.addArrangedSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(80)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(45)
            
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(45)
        }
        
        //Todo: - 넓이 조금 늘리기
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
           // $0.leading.equalTo(loginButton.snp.leading).offset(20)
            $0.height.equalTo(45)
        }
 
        borderView.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.width.equalTo(1)

        }

    }

}

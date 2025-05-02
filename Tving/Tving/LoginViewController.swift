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
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.leftViewMode = .always
        textField.backgroundColor = .lightGray
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password를 입력해주세요"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.leftViewMode = .always
        textField.backgroundColor = .lightGray
        textField.isSecureTextEntry = true
        textField.rightViewMode = .always
        return textField
    }()
    
    private lazy var secureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .darkGray
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .tvingRed
     //   button.setUnderLine(range: NSRange(location: 0, length: 5))
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
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
        stackView.backgroundColor = .black
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
        label.font = .systemFont(ofSize: 14, weight: .bold)
       // label.backgroundColor = .blue
        return label
    }()
    
    //Todo:  Label vs Button // 이름 하단에 밑줄 알아보기
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tving 회원가입하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        let fullRange = NSRange(location: 0, length: "Tving 회원가입하기".count)
        button.setUnderLine(range:fullRange)
     //   button.backgroundColor = .red
        return button
    }()
    
    private var rightViewContainer: UIView?
    
    private let notYetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        return stackView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupLayout()

    
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setupLayout() {
       // passwordTextField.rightView = secureButton
        [titleLabel,idTextField,passwordTextField,loginButton,findStackView,notYetStackView].forEach {
            self.view.addSubview($0)
        }
        //addSubView 쓰면 뷰들이 수동으로 정렬됨
        [findIDLabel,borderView,findPWDLabel].forEach {
            self.findStackView.addArrangedSubview($0)
        }
        
        [notYetLabel,signUpButton].forEach {
            self.notYetStackView.addArrangedSubview($0)
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
        
        notYetStackView.snp.makeConstraints {
            $0.top.equalTo(findStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
        
        

    }

    
    @objc
    private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        
        passwordTextField.isSecureTextEntry ? secureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal) :
            secureButton.setImage(UIImage(systemName: "eye"), for: .normal)
        
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            // 컨테이너 뷰 생성
            
            if rightViewContainer == nil {
                 rightViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
                
                // clearButton 생성
                let clearButton = UIButton(type: .custom)
                clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                clearButton.tintColor = .darkGray
                clearButton.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
                clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
                
                // secureButton 위치 설정
                secureButton.frame = CGRect(x: 40, y: 0, width: 30, height: 30)
                
                // 버튼들을 컨테이너에 추가
                rightViewContainer?.addSubview(clearButton)
                rightViewContainer?.addSubview(secureButton)
                
                
            }

            // 컨테이너를 rightView로 설정
            textField.rightView = rightViewContainer
            textField.rightViewMode = .always
        } else {
            textField.rightView = nil
            textField.rightViewMode = .never
        }
    }

    @objc
    private func clearTextField() {
        passwordTextField.text = ""
        // 텍스트가 비었으므로 rightView도 제거
        passwordTextField.rightView = nil
        passwordTextField.rightViewMode = .never
    }
    
    @objc
    private func loginButtonDidTap() {
        let mainViewController = MainViewController()
        let inputTextField = idTextField.text?.isEmpty == true ? nil : idTextField.text
        mainViewController.setDisplayText(inputTextField)
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {


}


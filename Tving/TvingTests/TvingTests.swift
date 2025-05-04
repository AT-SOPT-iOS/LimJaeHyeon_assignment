//
//  TvingTests.swift
//  TvingTests
//
//  Created by 임재현 on 4/21/25.
//

import XCTest
@testable import Tving

final class TvingTests: XCTestCase {
    
    var sut: LoginViewController!
    
    override func setUp() {
        super.setUp()
        sut = LoginViewController()
        sut.loadViewIfNeeded()
    }
    
    func test_togglePasswordVisibility_change() {
        //Given
        sut.passwordTextField.isSecureTextEntry = true
        
        //When
        sut.togglePasswordVisibility()
        
        //Then
        XCTAssertFalse(sut.passwordTextField.isSecureTextEntry)
    }
    
    func test_textFieldDidChange_setRightView() {
       //Given
        let textField = UITextField()
        textField.text = "12345"
        
        //When
        sut.textFieldDidChange(textField)
        
        //Then
        XCTAssertNotNil(textField.rightView)
        XCTAssertEqual(textField.rightViewMode, .always)
    }
    
    func test_textFieldDidChange_removesRightView_whenTextEmpty() {
        // Given
        let textField = UITextField()
        textField.text = ""

        // When
        sut.textFieldDidChange(textField)

        // Then
        XCTAssertNil(textField.rightView)
        XCTAssertEqual(textField.rightViewMode, .never)
    }

}

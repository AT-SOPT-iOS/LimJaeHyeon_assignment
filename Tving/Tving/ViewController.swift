//
//  ViewController.swift
//  Tving
//
//  Created by 임재현 on 4/21/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let box = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(box)
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        print("hi")
        box.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}


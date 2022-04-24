//
//  ViewController.swift
//  Password
//
//  Created by Felipe Filgueira on 23/04/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let passwordTextFieldView = PasswordTextFieldView(placeHolderText: "New password")
//    let passwordTextFieldView = PasswordTextFieldView()

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewConfiguration()
        
    }
}

extension ViewController: ViewConfiguration {
    func buildViewHierarchy() {
        stackView.addArrangedSubview(passwordTextFieldView)
        view.addSubview(stackView)
        //view.addSubview(passwordTextFieldView)
    }
    
    func configureView() {
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
//        passwordTextFieldView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().inset(20)// multipliedBy(1)
//            make.trailing.equalToSuperview().inset(20)// multipliedBy(1)
//        }
    }

}


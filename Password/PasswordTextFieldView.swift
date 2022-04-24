//
//  PasswordTextFieldView.swift
//  Password
//
//  Created by Felipe Filgueira on 23/04/22.
//

import Foundation
import UIKit

class PasswordTextFieldView: UIView {
    
    var placeHolderText: String
    
    lazy var lockImageView: UIImageView = {
        var imagemView = UIImageView()
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        let imagem = UIImage(systemName: "lock.fill")
        imagemView.image = imagem
        return imagemView
    }()
    
    lazy var textField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isSecureTextEntry = false
        txt.placeholder = placeHolderText
        txt.keyboardType = .asciiCapable
        txt.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        return txt
    }()
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        button.addTarget(self, action: #selector(tooglePasswordView), for: .touchUpInside)
        return button
    }()
    
    lazy var divideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .separator
        return view
    }()
    
    lazy var errorLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .red
        lbl.font = .preferredFont(forTextStyle: .footnote)
        lbl.isHidden = false
        lbl.text = "Enter you password"
        return lbl
    }()
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension PasswordTextFieldView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(divideView)
        addSubview(errorLabel)
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .orange
//        errorLabel.text = "Enter your password and again and again and again and again and again"
        errorLabel.text = "Your password must meet the requirements below"

        textField.delegate = self
        
        // CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
    }
    
    func setupConstraints() {
        lockImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(lockImageView.snp.trailing).multipliedBy(1)
        }
        
        eyeButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.trailing.equalToSuperview()
            make.leading.equalTo(textField.snp.trailing).multipliedBy(1)
        }
        
        divideView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).multipliedBy(1)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(divideView.snp.bottom).multipliedBy(1)
            make.trailing.leading.equalToSuperview()
        }
    }
}

extension PasswordTextFieldView {
    @objc func tooglePasswordView() {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}

extension PasswordTextFieldView: UITextFieldDelegate {
    
}

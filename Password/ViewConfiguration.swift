//
//  ViewConfiguration.swift
//  Password
//
//  Created by Felipe Filgueira on 23/04/22.
//

import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func configureView()
    func setupConstraints()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        configureView()
        buildViewHierarchy()
        setupConstraints()
    }
}

//
//  MainScreenView.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
    ///Действиe, при нажатии на кнопку
    func presentNewScreenButtonAction()
}

protocol MainScreenViewInput: AnyObject {
  
    /// Устанавливает текст
    /// - Parameters text: текст
    func setTitle(text: String)
    
    /// Изменение цвета экрана на рандомный
    func changeBackgroundColors()
}


final class MainScreenView: UIView & MainScreenViewInput {
    
    weak var output: MainScreenViewOutput?
    
    private let titleLabel = UILabel()
    private let presentNewScreenButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupConstraints()
        setupDefaultSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func changeBackgroundColors() {
        backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    public func setTitle(text: String) {
        titleLabel.text = text
    }
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        presentNewScreenButton.setTitle(Appearents().someName, for: .normal)
        presentNewScreenButton.setTitleColor(.blue, for: .normal)
        presentNewScreenButton.addTarget(self, action: #selector(presentNewScreenButtonAction), for: .touchUpInside)
        titleLabel.textColor = .red
    }
    
    @objc func presentNewScreenButtonAction() {
        output?.presentNewScreenButtonAction()
    }
    
    private func setupConstraints() {
        [presentNewScreenButton, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            presentNewScreenButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            presentNewScreenButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Appearents().padding),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

private extension MainScreenView {
    struct Appearents {
        let padding: CGFloat = 30
        let someName = "Нажать для изменения цвета экрана"
    }
}

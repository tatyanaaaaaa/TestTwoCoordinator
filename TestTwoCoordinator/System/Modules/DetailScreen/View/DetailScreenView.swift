//
//  DetailScreenView.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol DetailScreenViewOutput: AnyObject {
    
    /// Кнопка была нажата пользователем
    func presentNewScreenButtonPush()
}

protocol DetailScreenViewInput: AnyObject {
    
    /// Установить текст
    ///  - Parameters text: текст для titleLabel
    func setText(text: String)
    
    /// Установить цвет
    ///  - Parameters color: цвет экрана
    func changeBackgroundColor(color: UIColor?)
}

final class DetailScreenView: UIView & DetailScreenViewInput {
    
    weak var output: DetailScreenViewOutput?
    
    private let titleLabel = UILabel()
    private let presentNewScreenButton = UIButton()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupDefaultSettings()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setText(text: String) {
        titleLabel .text = text
    }
    
    public func changeBackgroundColor(color: UIColor?) {
        guard let color = color else { return }
        backgroundColor = color
    }
    
    private func setupDefaultSettings() {
        backgroundColor = .white
        
        presentNewScreenButton.setTitleColor(.red, for: .normal)
        presentNewScreenButton.setTitle(Appearents().setText, for: .normal)
        presentNewScreenButton.addTarget(self, action: #selector(presentNewScreenButtonPush), for: .touchUpInside)
    }
    
    @objc func presentNewScreenButtonPush() {
        output?.presentNewScreenButtonPush()
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

extension DetailScreenView {
    struct Appearents {
        let setText = "Закрыть экран"
        let padding: CGFloat = 30
    }
}

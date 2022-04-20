//
//  MainScreenFactory.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol MainScreenFactoryOutput: AnyObject {
    
    /// Данные были изменены
    /// - Parameters text ; текст готов
    func didReciveFull(text: String)
}

protocol MainScreenFactoryInput: AnyObject {
    
    ///Текст был получен
    ///- Parameters text: начало текста
    func createText(text: String)
}

final class MainScreenFactory: MainScreenFactoryInput {
    func createText(text: String) {
        let appearents = "\(Appearents().someText) \(text)"
        output?.didReciveFull(text: appearents)
    }
    
    
    weak var output: MainScreenFactoryOutput?
}

private extension MainScreenFactory {
    struct Appearents {
        let someText = "Hello, "
    }
}

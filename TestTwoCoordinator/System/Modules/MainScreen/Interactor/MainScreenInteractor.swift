//
//  MainScreenInteractor.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol MainScreenInteractorOutput: AnyObject {
    
    /// Были загружен текст
    /// - Parameters color: получен текст
    func didRecive(text: String)
}

protocol MainScreenInteractorInput: AnyObject {
    
    /// Загрузить цвета
    func getContent()
}

final class MainScreenInteractor: MainScreenInteractorInput {

    weak var output: MainScreenInteractorOutput?
    
    func getContent() {
        output?.didRecive(text: Appearents().setText)
    }
}

private extension MainScreenInteractor {
    struct Appearents {
        let setText = "world"
    }
}

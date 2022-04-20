//
//  DetailScreenInteractor.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol DetailScreenInteractorOutput: AnyObject {
    
    /// Готовые данные
    ///  - Parameters text: данные исправны
    func didRecive(text: String)
}

protocol DetailScreenInteractorInput: AnyObject {
    
    /// Данные были получены
    func getContent()
}

final class DetailScreenInteractor: DetailScreenInteractorInput {

    weak var output: DetailScreenInteractorOutput?
    
    func getContent() {
        output?.didRecive(text: Appearents().someName)
    }
}

extension DetailScreenInteractor {
    struct Appearents {
        let someName = "received."
    }
}

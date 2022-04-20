//
//  DetailScreenFactory.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol DetailScreenFactoryOutput: AnyObject {
    
    /// Данные полностью готовы
    ///  - Parameters text: good
    func didReciveFull(text: String)
}

protocol DetailScreenFactoryInput: AnyObject {
    
    /// Данные получены на обработку
    ///  - Parameters text
    func createText(text: String)
}

final class DetailScreenFactory: DetailScreenFactoryInput {

    weak var output: DetailScreenFactoryOutput?
    
    func createText(text: String) {
        let appearents = "\(Appearents().someTwoName) \(text)"
        output?.didReciveFull(text: appearents)
    }
}

private extension DetailScreenFactory {
    struct Appearents {
        let someTwoName = "Data was "
    }
}

//
//  DetailScreenModule.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol DetailScreenModuleOutput: AnyObject {
    
}

protocol DetailScreenModuleInput: AnyObject {
    
}

typealias DetailScreenViewController = UIViewController & DetailScreenModuleInput

final class DetailScreenModule: DetailScreenViewController {
    
    weak var moduleOutput: DetailScreenModuleOutput?
    
    private let moduleView: DetailScreenViewInput & UIView
    private let interactor: DetailScreenInteractorInput
    private let factory: DetailScreenFactoryInput
    
    init(moduleView: DetailScreenViewInput & UIView, interactor: DetailScreenInteractorInput, factory: DetailScreenFactoryInput) {
        self.moduleView = moduleView
        self.interactor = interactor
        self.factory = factory
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Appearents().setTitle
        interactor.getContent()
    }
}

extension DetailScreenModule: DetailScreenViewOutput {
    func presentNewScreenButtonPush() {
        moduleView.changeBackgroundColor(color: .green)
    }
}

extension DetailScreenModule: DetailScreenFactoryOutput {
    func didReciveFull(text: String) {
        moduleView.setText(text: text)
    }
}

extension DetailScreenModule: DetailScreenInteractorOutput {
    func didRecive(text: String) {
        factory.createText(text: text)
    }
}

private extension DetailScreenModule {
    struct Appearents {
        let setTitle = "Detain screen"
    }
}

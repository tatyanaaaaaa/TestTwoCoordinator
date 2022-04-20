//
//  MainScreenModule.swift
//  TestTwoCoordinator
//
//  Created by Tatiana Sosina on 20.04.2022.
//

import UIKit

protocol MainScreenModuleOutput: AnyObject {
    
}

protocol MainScreenModuleInput: AnyObject {
    
}

typealias MainScreenModuleViewController = UIViewController & MainScreenModuleInput

final class MainScreenModule: MainScreenModuleViewController {
    
    weak var moduleOutput: MainScreenModuleOutput?
    
    private let moduleView: MainScreenViewInput & UIView
    private let interactor: MainScreenInteractorInput
    private let factory: MainScreenFactoryInput
    
    init(moduleView: MainScreenViewInput & UIView, interactor: MainScreenInteractorInput, factory: MainScreenFactoryInput) {
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
        interactor.getContent()
        title = Appearens().setTitle
    }
}

extension MainScreenModule: MainScreenViewOutput {
    func presentNewScreenButtonAction() {
        moduleView.changeBackgroundColors()
    }
}

extension MainScreenModule: MainScreenInteractorOutput {
    func didRecive(text: String) {
        factory.createText(text: text)
    }
}

extension MainScreenModule: MainScreenFactoryOutput {
    func didReciveFull(text: String) {
        moduleView.setTitle(text: text)
    }
}

extension MainScreenModule {
    struct Appearens {
        let setTitle = "Main screen"
    }
}

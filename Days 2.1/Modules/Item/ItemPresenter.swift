//
//  ItemPresenter.swift
//  Days 2.1
//
//  Created by Олег Еременко on 11.07.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

protocol ItemPresenterProtocol: AnyObject {
    var router: ItemRouterProtocol! { get set }
    func configureViewElements()
    func saveButtonClicked()
    func checkNameForLetters(textField: UITextField)
    func enableSaveButton()
    func disableSaveButton()
}

final class ItemPresenter: ItemPresenterProtocol {

    // MARK: - Public properties
    
    weak var view  : ItemViewControllerProtocol!
    var interactor : ItemInteractorProtocol!
    var router     : ItemRouterProtocol!
    
    // MARK: - Init
    
    required init(view: ItemViewControllerProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func configureViewElements() {
        view.configureViewElements()
    }
    
    func saveButtonClicked() {
        router.closeCurrentViewController()
    }
    
    func checkNameForLetters(textField: UITextField) {
        interactor.checkNameForLetters(textField: textField)
    }
    
    func enableSaveButton() {
        view.enableSaveButton()
    }
    
    func disableSaveButton() {
        view.disableSaveButton()
    }
    
}

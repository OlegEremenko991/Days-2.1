//
//  MainPresenter.swift
//  Days 2.1
//
//  Created by Олег Еременко on 11.07.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import RealmSwift

protocol MainPresenterProtocol: AnyObject {
    func configureView()
    func reloadTVData()
    func addItem(with title: String)
    func removeItem(item: Item)
    func saveItem(item: Item)
    func dateToTextDays(item: Item) -> String
    func addButtonClicked()
    var realm      : Realm { get }
    var router     : MainRouterProtocol! { set get }
    var items      : Results<Item>? { get set }
}

final class MainPresenter: MainPresenterProtocol {  

    // MARK: - Public properties
    
    weak var view  : MainViewControllerProtocol!
    var interactor : MainInteractorProtocol!
    let realm      = try! Realm()
    var router     : MainRouterProtocol!
    var items      : Results<Item>?
    
    // MARK: - Init
    
    required init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func configureView() {
        interactor.loadItems()
    }
    
    func addItem(with title: String) {
        interactor.addItem(with: title)
    }
    
    func reloadTVData() {
        view.reloadTableViewData()
    }
    
    func removeItem(item: Item) {
        interactor.removeItem(item: item)
    }
    
    func saveItem(item: Item) {
        interactor.saveItem(item: item)
    }
    
    func dateToTextDays(item: Item) -> String {
        interactor.dateToTextDays(item: item)
    }
    
    func addButtonClicked() {
        router.showItemScene()
    }

}

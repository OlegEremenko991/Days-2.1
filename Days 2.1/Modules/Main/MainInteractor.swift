//
//  MainInteractor.swift
//  Days 2.1
//
//  Created by Олег Еременко on 11.07.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func loadItems() {
        presenter.items = presenter.realm.objects(Item.self).sorted(byKeyPath: "itemName", ascending: true)
        presenter.reloadTVData()
    }
    
    func saveItem(item: Item) {
        try! presenter.realm.write {
            presenter.realm.add(item)
        }
        presenter.reloadTVData()
    }
    
    func addItem(with title: String){
        let newItem = Item()
        newItem.itemName = title
        saveItem(item: newItem)
    }
    
    func removeItem(item: Item){
        do {
            try presenter.realm.write {
                presenter.realm.delete(item)
            }
        } catch {
            print("Error deleting item, \(error)")
        }
    }
    
    func dateToTextDays(item: Item) -> String {
        let today = Date().timeIntervalSince(item.date)
        return "\(Int(today)/86400) days"
    }
}

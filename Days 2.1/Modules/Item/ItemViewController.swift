//
//  NewItemVC.swift
//  Days 2.1
//
//  Created by Олег Еременко on 28.06.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, ItemViewProtocol {
   
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var presenter: ItemPresenterProtocol!
    let configurator: ItemConfiguratorProtocol = ItemConfigurator()
    
    var delegate: ItemViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureViewElements()
    }   
    
    @IBAction func editingChanged(_ sender: UITextField) {
        presenter.checkNameForLetters(textField: sender)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        delegate?.setItemData(label: itemNameTextField.text!, date: itemDatePicker.date)
        presenter.saveButtonClicked()
    }
    
    func configureViewElements(){
        disableSaveButton()
        itemDatePicker.datePickerMode = .date
    }
    
    func enableSaveButton(){
        saveButton.isEnabled = true
    }
    
    func disableSaveButton(){
        saveButton.isEnabled = false
    }
}

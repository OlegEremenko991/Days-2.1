//
//  MainRouter.swift
//  Days 2.1
//
//  Created by Олег Еременко on 11.07.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func showItemScene()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

final class MainRouter: MainRouterProtocol {
    
    // MARK: - Public properties
    
    weak var viewController     : MainViewController!
    
    // MARK: - Private properties
    
    private let mainToItemSegue = "MainToItemSegue"
    
    // MARK: - Init
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Methods
    
    func showItemScene() {
        viewController.performSegue(withIdentifier: mainToItemSegue, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ItemViewController{
            vc.delegate = viewController
        }
    }
}

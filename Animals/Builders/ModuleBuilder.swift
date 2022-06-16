import Foundation
import UIKit

protocol Builder {
    
    static func createMenuModule() -> UIViewController
    static func createAnimalListModule() -> UIViewController
    static func createAnimalDetailModule(animal: Animal?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMenuModule() -> UIViewController {
        let view = MenuViewController()
        let presenter = MenuPresenter(view: view)
        view.presenter = presenter

        return view
    }
    
    static func createAnimalListModule() -> UIViewController {
        let view = AnimalListViewController()
        let networkService = NetworkService()
        let presenter = AnimalListPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
     
    static func createAnimalDetailModule(animal: Animal?) -> UIViewController {
        let view = AnimalDetailViewController()
        let presenter = AnimalDetailPresenter(view: view, animal: animal)
        view.presenter = presenter
        
        return view
    }
    
}

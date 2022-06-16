import UIKit

protocol MenuViewProtocol : AnyObject {
    func pushViewController(vc: UIViewController)
}

protocol MenuPresenterProtocol : AnyObject {
    
    init(view: MenuViewProtocol)
    func openAnimalModule()
}

class MenuPresenter : MenuPresenterProtocol {
    
    // MARK: - Properties
    private weak var view: MenuViewProtocol?
    
    // MARK: - Init
    required init(view: MenuViewProtocol) {
        self.view = view

    }
    
    // MARK: - Public methods
    func openAnimalModule() {
        let animalListViewController = ModuleBuilder.createAnimalListModule()
        animalListViewController.modalPresentationStyle = .fullScreen
        
        view?.pushViewController(vc: animalListViewController)
    }
    
}

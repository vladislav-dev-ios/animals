import UIKit

protocol AnimalDetailViewProtocol: AnyObject {
    func setAnimal(animal: Animal?)
}

protocol AnimalDetailPresenterProtocol: AnyObject {
    
    init(view: AnimalDetailViewProtocol, animal: Animal?)
    
    func setAnimal()
}

class AnimalDetailPresenter: AnimalDetailPresenterProtocol {

    // MARK: -  Properties
    private weak var view: AnimalDetailViewProtocol?
    private var animal: Animal?
    
    // MARK: -  Init
    required init(view: AnimalDetailViewProtocol, animal: Animal?) {
        self.view = view
        self.animal = animal
    }
    
    // MARK: -  Public methods
    func setAnimal() {
        view?.setAnimal(animal: animal)
    }
    
    
}

import Foundation
import UIKit

protocol AnimalListViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
    func presentView(vc: UIViewController)
}

protocol AnimallListPresenterProtocol: AnyObject {
    
    init(view: AnimalListViewProtocol, networkService: NetworkServiceProtocol)
    func getAnimals()
    func getCountOfAnimals() -> Int
    func getImageUrlOfAnimal(index: Int) -> String?
    func getAnimal(index: Int) -> Animal?
    func openAnimalDetailModule(index: Int)
    
    var animals: [Animal]? { get set }
}


class AnimalListPresenter: AnimallListPresenterProtocol {
    
    // MARK: - Properties
    private weak var view: AnimalListViewProtocol?
    private let networkService: NetworkServiceProtocol!
    
    var animals: [Animal]?
    
    // MARK: - Init
    required init(view: AnimalListViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        
        getAnimals()
    }
    
    // MARK: - Public methods
    func getAnimals() {
        
        networkService.getAnimals { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let animals):
                    self.animals = animals
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getCountOfAnimals() -> Int {
        return animals?.count ?? 0
    }
    
    func getImageUrlOfAnimal(index: Int) -> String? {
        return animals?[index].image_link ?? nil
    }
    
    func getAnimal(index: Int) -> Animal? {
        return animals?[index]
    }
    
    func openAnimalDetailModule(index: Int) {
        guard let animal = animals?[index] else { return }
        
        let animalDetailModule = ModuleBuilder.createAnimalDetailModule(animal: animal)
        view?.presentView(vc: animalDetailModule)
    }
}

import UIKit

class AnimalDetailViewController: UIViewController {
    
    // MARK: Properties
    private lazy var customView = AnimalDetailView()
    
    var presenter: AnimalDetailPresenterProtocol?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.setAnimal()
    }
    
}

// MARK: - AnimalDetailView Protocol
extension AnimalDetailViewController: AnimalDetailViewProtocol {
    
    func setAnimal(animal: Animal?) {
        guard let animal = animal else {
            return
        }
        
        customView.configure(nameText: animal.name,
                             latinNameText: animal.latin_name,
                             habitatText: animal.habitat,
                             geoText: animal.geo_range,
                             lifespan: animal.lifespan,
                             dietText: animal.diet)
        
        if let url = URL(string: animal.image_link) {
            ImageLoader.fetch(url: url) { image in
                self.customView.setImage(image: image)
            }
        }
    }
    
}

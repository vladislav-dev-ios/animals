import UIKit

class MenuViewController: UIViewController {
    
    // MARK: Properties
    private lazy var customView = MenuView()
    
    var presenter: MenuPresenterProtocol?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCallbacks()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customView.startAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        customView.stopAnimation()
    }
    
    // MARK: - Priavate Methods
    private func setupCallbacks() {
        customView.callbackForStartButton = startButtonTapped
    }
    
    private func startButtonTapped() {
        presenter?.openAnimalModule()
    }
}

// MARK: - MenuView Protocol

extension MenuViewController: MenuViewProtocol {
    
    func pushViewController(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

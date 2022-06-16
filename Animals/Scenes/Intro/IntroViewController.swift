import UIKit

class IntroViewController: UIViewController {
    
    // MARK: Properties
    private lazy var customView = IntroView()
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.startAnimation(completion: startApplicaton)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        customView.stopAnimation()
    }
}

// MARK: - Private Methods
extension IntroViewController {
    
    private func startApplicaton() {
        
        let menuVC = ModuleBuilder.createMenuModule()
        let navigationVC = UINavigationController(rootViewController: menuVC)
        
        (UIApplication.shared.delegate as? AppDelegate)?.reloadRootController(navigationVC)
    }
}

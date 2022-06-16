import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = IntroViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    func reloadRootController(_ vc: UIViewController, animated: Bool = true) {
        
        guard let window = self.window else {
            return
        }
        
        window.rootViewController = vc
    }

}


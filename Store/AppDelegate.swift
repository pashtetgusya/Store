import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let homeScreenWidgetRepository = HomeScreenWidgetRepository()
        let homeScreenViewModel = HomeScreenViewModel(widgetRepository: homeScreenWidgetRepository)
        let homeScreenViewController = HomeScreenViewController(viewModel: homeScreenViewModel)
        homeScreenViewController.tabBarItem.image = UIImage(systemName: "house")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: homeScreenViewController),
        ]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

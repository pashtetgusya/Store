import UIKit
import Swinject

// MARK: - Tab bar assemly

final class TabBarAssembly: Assembly {
    
    // MARK: Assembly protocol implementation
    
    func assemble(container: Container) {
        container.register(TabBarController.self) { resolver in
            guard
                let homeViewController = resolver.resolve(HomeScreenViewController.self),
                let catalogViewController = resolver.resolve(CatalogScreenViewController.self),
                let cartViewController = resolver.resolve(CartScreenViewController.self),
                let searchViewController = resolver.resolve(SearchScreenViewController.self)
            else { fatalError() }
            
            let homeNavController = UINavigationController(rootViewController: homeViewController)
            let catalogNavController = UINavigationController(rootViewController: catalogViewController)
            let cartNavController = UINavigationController(rootViewController: cartViewController)
            let searchNavController = UINavigationController(rootViewController: searchViewController)
            
            let tabBarController = TabBarController()
            tabBarController.setupTabBarItem(viewController: homeViewController, item: .home)
            tabBarController.setupTabBarItem(viewController: catalogViewController, item: .catalog)
            tabBarController.setupTabBarItem(viewController: cartViewController, item: .cart)
            tabBarController.setupTabBarItem(viewController: searchViewController, item: .search)
            tabBarController.viewControllers = [
                homeNavController,
                catalogNavController,
                cartNavController,
                searchNavController
            ]
            
            return tabBarController
        }
    }
}

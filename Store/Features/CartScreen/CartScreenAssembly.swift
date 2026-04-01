import UIKit

final class CartScreenAssembly {
    
    // MARK: Initialization
    
    private init() { }
    
    // MARK: Build function
    
    static func build() -> UIViewController {
        let viewController = UIViewController()
        viewController.navigationItem.title = "Корзина"
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: "cart")
        navController.tabBarItem.tag = 2
        navController.tabBarItem.title = nil
        
        return navController
    }
}

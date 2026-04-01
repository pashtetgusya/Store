import UIKit

final class CatalogScreenAssembly {
    
    // MARK: Initialization
    
    private init() { }
    
    // MARK: Build function
    
    static func build() -> UIViewController {
        let viewController = UIViewController()
        viewController.navigationItem.title = "Каталог"
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: "text.page.badge.magnifyingglass")
        navController.tabBarItem.tag = 1
        navController.tabBarItem.title = nil
        
        return navController
    }
}

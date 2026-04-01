import UIKit

final class SearchScreenAssembly {
    
    // MARK: Initialization
    
    private init() { }
    
    // MARK: Build function
    
    static func build() -> UIViewController {
        let viewController = UIViewController()
        viewController.navigationItem.title = "Поиск"
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = .init(tabBarSystemItem: .search, tag: 3)
        navController.tabBarItem.title = nil
        
        return navController
    }
}

import UIKit

final class HomeScreenAssembly {
    
    // MARK: Initialization
    
    private init() { }
    
    // MARK: Build function
    
    static func build() -> UIViewController {
        let widgetRepository = HomeScreenWidgetRepository()
        let viewModel = HomeScreenViewModel(widgetRepository: widgetRepository)
        let viewController = HomeScreenViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = UIImage(systemName: "house")
        navController.tabBarItem.tag = 0
        navController.tabBarItem.title = nil
        
        return navController
    }
}

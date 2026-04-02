import UIKit

// MARK: - Tab bar controller

final class TabBarController: UITabBarController {
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    // MARK: Setup functions
    
    func setupTabBarItem(viewController: UIViewController, item: TabBarItem) {
        switch item {
        case .search:
            viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: item.tag)
        default:
            viewController.tabBarItem = UITabBarItem(title: item.title, image: item.icon, tag: item.tag)
        }
    }
    
    private func setupAppearance() {
        tabBar.tintColor = .black
    }
}

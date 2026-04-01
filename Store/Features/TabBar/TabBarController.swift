import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Setup functions
    
    func setupAppearance() {
        tabBar.tintColor = .black
        viewControllers = [
            HomeScreenAssembly.build(),
            CatalogScreenAssembly.build(),
            CartScreenAssembly.build(),
            SearchScreenAssembly.build()
        ]
    }
}

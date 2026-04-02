import UIKit

// MARK: - Tab bar item

enum TabBarItem {
    
    // MARK: Cases
    
    case home
    case catalog
    case cart
    case search
    
    // MARK: Properties
    
    var title: String? { nil }
    var icon: UIImage? {
        switch self {
        case .home: UIImage(systemName: "house")
        case .catalog: UIImage(systemName: "text.page.badge.magnifyingglass")
        case .cart: UIImage(systemName: "cart")
        case .search: UIImage(systemName: "magnifyingglass")
        }
    }
    var tag: Int {
        switch self {
        case .home: 0
        case .catalog: 1
        case .cart: 2
        case .search: 3
        }
    }
}

import Foundation

enum HomeScreenWidget {
    
    // MARK: Cases
    
    case productOfDay
    case bannerWidget
    
    // MARK: Properties
    
    var tag: Int {
        switch self {
        case .productOfDay: 0
        case .bannerWidget: 1
        }
    }
}

import UIKit

// MARK: - Home screent widget repository protocol 

protocol HomeScreenWidgetRepository {
    
    func getWidget(_ widget: HomeScreenWidget) -> UIViewController
}

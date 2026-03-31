import UIKit

final class HomeScreenWidgetRepository {
    
    func getWidget(_ widget: HomeScreenWidget) -> UIViewController {
        switch widget {
        case .productOfDay:
            let viewModel = ProductOfDayWidgetViewModel()
            let viewController = ProductOfDayWidgetViewController(viewModel: viewModel)
            viewController.view.tag = widget.tag
            
            return viewController
        case .bannerWidget:
            let viewController = BannerWidgetViewController()
            viewController.view.tag = widget.tag
            
            return viewController
        }
    }
}

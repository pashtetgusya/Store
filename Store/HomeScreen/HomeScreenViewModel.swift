import UIKit
import Combine

final class HomeScreenViewModel {
    
    // MARK: Propeties
    
    @Published var widgets: [UIViewController] = []
    private let widgetRepository: HomeScreenWidgetRepository
    
    // MARK: Initialization
    
    init(widgetRepository: HomeScreenWidgetRepository) {
        self.widgetRepository = widgetRepository
    }
    
    // MARK: Load functions
    
    func loadWidgets() {
        widgets = [
            widgetRepository.getWidget(.productOfDay),
            widgetRepository.getWidget(.bannerWidget)
        ]
    }
}

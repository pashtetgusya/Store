import UIKit
import Swinject

// MARK: - Home screen assembly

final class HomeScreenAssembly: Assembly {
    
    // MARK: Assembly protocol implementation
    
    func assemble(container: Container) {
        container.register(HomeScreenWidgetRepository.self) { _ in
            HomeScreenWidgetRepositoryImpl()
        }
        
        container.register(HomeScreenViewModel.self) { resolver in
            guard let widgetRepository = resolver.resolve(HomeScreenWidgetRepository.self) else { fatalError() }
            let viewModel = HomeScreenViewModel(widgetRepository: widgetRepository)
            
            return viewModel
        }
        
        container.register(HomeScreenViewController.self) { resolver in
            guard let viewModel = resolver.resolve(HomeScreenViewModel.self) else { fatalError() }
            let viewController = HomeScreenViewController(viewModel: viewModel)
            
            return viewController
        }
    }
}

import UIKit
import Swinject

// MARK: - Search screen assembly

final class SearchScreenAssembly: Assembly {
    
    // MARK: Assembly protocol implementation
    
    func assemble(container: Container) {
        container.register(SearchScreenViewController.self) { _ in
            SearchScreenViewController()
        }
    }
}

import UIKit
import Swinject

// MARK: - Catalog screen assembly

final class CatalogScreenAssembly: Assembly {
    
    // MARK: Assembly protocol implementation
    
    func assemble(container: Container) {
        container.register(CatalogScreenViewController.self) { _ in
            CatalogScreenViewController()
        }
    }
}

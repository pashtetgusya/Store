import UIKit
import Swinject

// MARK: - Card screen assembly

final class CartScreenAssembly: Assembly {
    
    // MARK: Assembly protocol implementation
    
    func assemble(container: Container) {
        container.register(CartScreenViewController.self) { _ in
            CartScreenViewController()
        }
    }
}

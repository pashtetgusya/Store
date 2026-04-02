import Foundation
import Swinject

// MARK: - Application registrations

final class AppRegistrations {
    
    // MARK: Initialization
    
    private init() { }
    
    // MARK: Registration function
    
    static func register(in container: Container) {
        let assemblies = [
            HomeScreenAssembly(),
            CatalogScreenAssembly(),
            CartScreenAssembly(),
            SearchScreenAssembly(),
            TabBarAssembly()
        ] as [Assembly]
        assemblies.forEach { $0.assemble(container: container) }
    }
}

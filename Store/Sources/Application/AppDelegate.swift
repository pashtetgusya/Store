import UIKit
import Swinject

// MARK: - Application delegate

@main final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Properties
    
    static var shared: AppDelegate { UIApplication.shared.delegate as! AppDelegate }
    var diContainer: Container!
        
    // MARK: UI application delegate protocol implementation
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupDIContainer()
        setupAppDependencies()
        
        return true
    }
    
    // MARK: Setup functions
    
    private func setupDIContainer() {
        diContainer = Container()
    }
    
    private func setupAppDependencies() {
        AppRegistrations.register(in: diContainer)
    }
}

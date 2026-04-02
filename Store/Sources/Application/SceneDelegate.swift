import UIKit
import Swinject

// MARK: - Scene delegate

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: Properites
    
    var window: UIWindow?
    
    // MARK: UI window scene delegate protocol implementation
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
                
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = AppDelegate.shared.diContainer.resolve(TabBarController.self)
        window?.makeKeyAndVisible()
    }
}

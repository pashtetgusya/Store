import UIKit

// MARK: - Cart screen view controller

final class CartScreenViewController: UIViewController {
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearances()
    }
    
    // MARK: Setup functions
    
    private func setupAppearances() {
        navigationItem.title = "Корзина"
    }
}

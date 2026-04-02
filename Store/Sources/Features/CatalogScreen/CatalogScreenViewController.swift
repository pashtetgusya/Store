import UIKit

// MARK: - Catalog screen view controller

final class CatalogScreenViewController: UIViewController {
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearances()
    }
    
    // MARK: Setup functions
    
    private func setupAppearances() {
        navigationItem.title = "Каталог"
    }
}

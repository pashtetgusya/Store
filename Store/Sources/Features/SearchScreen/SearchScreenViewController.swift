import UIKit

// MARK: - Search screen view controller

final class SearchScreenViewController: UIViewController {
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearances()
    }
    
    // MARK: Setup functions
    
    private func setupAppearances() {
        navigationItem.title = "Поиск"
    }
}

import UIKit
import Combine

final class HomeScreenViewController: UIViewController {
    
    // MARK: Properties
    
    private let contentView: HomeScreenView
    private let viewModel: HomeScreenViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Initialization
    
    init(viewModel: HomeScreenViewModel) {
        self.contentView = HomeScreenView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Life cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupViewModelBindings()
        viewModel.loadWidgets()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Setup functions
    
    private func setupAppearance() {
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    private func setupViewModelBindings() {
        viewModel.$widgets
            .sink { [weak self] viewControllers in
                for viewController in viewControllers {
                    self?.addChild(viewController)
                    viewController.didMove(toParent: self)
                    self?.contentView.addWidget(viewController.view)
                }
            }
            .store(in: &cancellables)
    }
}

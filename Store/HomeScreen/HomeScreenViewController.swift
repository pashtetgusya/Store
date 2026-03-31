import UIKit
import Combine

final class HomeScreenViewController: UIViewController {
    
    // MARK: Properties
    
    private let contentView: HomeScreenView
    private let viewModel: HomeScreenViewModel
    private var initialContentOffset: CGPoint = .zero
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
        setupViewBindings()
        setupViewModelBindings()
        viewModel.loadWidgets()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard initialContentOffset == .zero else { return }
        initialContentOffset = contentView.scrollView.contentOffset
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Setup functions
    
    private func setupAppearance() {
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    private func setupViewBindings() {
        contentView.scrollView.delegate = self
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

// MARK: - UI scroll view delegate
 
extension HomeScreenViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let startOffset = abs(initialContentOffset.y)
        let currentOffset = scrollView.contentOffset.y + startOffset
        let progress = min(1.0, currentOffset / startOffset)
        let opacity = Float(min(1, 1 - progress))
        contentView.backgroundGradientLayer.opacity = opacity
    }
}

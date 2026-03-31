import UIKit
import Combine

final class ProductOfDayWidgetViewController: UIViewController {
    
    // MARK: Properties
    
    private let contentView: ProductOfDayWidgetView
    private let viewModel: ProductOfDayWidgetViewModel
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: Initialization
    
    init(viewModel: ProductOfDayWidgetViewModel) {
        self.contentView = ProductOfDayWidgetView()
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
        setupViewBindings()
        setupViewModelBindings()
        viewModel.loadWidgetData()
    }
    
    // MARK: Setup functions
    
    private func setupViewBindings() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
    
    private func setupViewModelBindings() {
        viewModel.$rows
            .sink { [weak self] _ in
                self?.contentView.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
}

// MARK: - UI collection view delegate

extension ProductOfDayWidgetViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - UI collection view data source

extension ProductOfDayWidgetViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.rows.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductOfDayWidgetViewCell",
            for: indexPath
        )
        cell.contentView.backgroundColor = .lightGray
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
}

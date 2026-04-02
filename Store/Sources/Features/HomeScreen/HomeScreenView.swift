import UIKit

final class HomeScreenView: UIView {
    
    // MARK: Subviews
    
    let backgroundGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.black.cgColor,
            UIColor.black.withAlphaComponent(0.75).cgColor
        ]
        layer.startPoint = .init(x: 0, y: 0)
        layer.endPoint = .init(x: 1, y: 1)
        
        return layer
    }()
    let headerView: HomeScreenHeaderView = {
        let view = HomeScreenHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    let bodyView: HomeScreenBodyView = {
        let view = HomeScreenBodyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: Properties
    
    private let headerViewHeight: CGFloat = UIScreen.main.bounds.height / 5
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstrains()
        setupAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundGradientLayer.frame = bounds
    }
    
    // MARK: Setup functions
    
    func addWidget(_ view: UIView) {
        bodyView.scrollContentStackView.addArrangedSubview(view)
    }
    
    private func addSubviews() {
        layer.addSublayer(backgroundGradientLayer)
        addSubview(headerView)
        addSubview(bodyView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight),
            
            bodyView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bodyView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupAppearance() {
        backgroundColor = .white
        bodyView.scrollView.contentInset = UIEdgeInsets(
            top: headerViewHeight,
            left: 0,
            bottom: 0,
            right: 0
        )
        bodyView.scrollView.delegate = self
    }
}

// MARK: - UI scroll view delegate

extension HomeScreenView: UIScrollViewDelegate {
   
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let startOffset = abs(bodyView.initialContentOffset.y)
       let currentOffset = scrollView.contentOffset.y + startOffset
       let progress = min(1.0, currentOffset / startOffset)
       let opacity = Float(min(1, 1 - progress))
       backgroundGradientLayer.opacity = opacity
   }
}

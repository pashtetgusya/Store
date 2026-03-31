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
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    let scrollBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    let scrollContentStackView: OrderedStackView = {
        let stackView = OrderedStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.distribution = .fill
        stackView.spacing = 20
        
        return stackView
    }()
    
    // MARK: Properties
    
    private let scrollViewTopCornerRadius: CGFloat = 20
    private let scrollViewContentTopPadding: CGFloat = 20
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
        scrollContentStackView.addArrangedSubview(view)
    }
    
    private func addSubviews() {
        layer.addSublayer(backgroundGradientLayer)
        addSubview(headerView)
        addSubview(scrollView)
        scrollView.addSubview(scrollBackgroundView)
        scrollView.addSubview(scrollContentStackView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerViewHeight),
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scrollBackgroundView.topAnchor.constraint(equalTo: scrollContentStackView.topAnchor),
            scrollBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollBackgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollBackgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            scrollContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
    private func setupAppearance() {
        backgroundColor = .white
        scrollView.contentInset = UIEdgeInsets(top: headerViewHeight, left: 0, bottom: 0, right: 0)
        scrollContentStackView.layoutMargins = UIEdgeInsets(
            top: scrollViewContentTopPadding,
            left: 0,
            bottom: scrollViewContentTopPadding,
            right: 0
        )
    }
}

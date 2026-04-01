import UIKit

final class HomeScreenBodyView: UIView {
    
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
    var initialContentOffset: CGPoint = .zero
    
    // MARK: Initilalization
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        setupAppearance()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard initialContentOffset == .zero else { return }
        initialContentOffset = scrollView.contentOffset
    }
    
    // MARK: Setup functions
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(scrollBackgroundView)
        scrollView.addSubview(scrollContentStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
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
        scrollContentStackView.layoutMargins = UIEdgeInsets(
            top: scrollViewContentTopPadding,
            left: 0,
            bottom: scrollViewContentTopPadding,
            right: 0
        )
    }
}

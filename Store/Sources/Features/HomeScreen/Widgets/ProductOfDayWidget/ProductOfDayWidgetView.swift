import UIKit

final class ProductOfDayWidgetView: UIView {
    
    // MARK: Subviews
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 250, height: 160)
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "ProductOfDayWidgetViewCell"
        )
        
        return collectionView
    }()
    
    // MARK: Properties
    
    override var intrinsicContentSize: CGSize {
        CGSize(
            width: UIScreen.main.bounds.width,
            height: (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize.height ?? 0
        )
    }
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstrains()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: Setup functions
    
    private func addSubviews() {
        addSubview(collectionView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
